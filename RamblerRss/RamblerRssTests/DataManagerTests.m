//
//  DataManagerTests.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 26/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsDataManager.h"
#import "BaseNewsItemEntity.h"
#import "NewsServiceInterface.h"

@interface DataManagerTests : XCTestCase

@end

@implementation DataManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGettingData {
    // given
    id<NewsServiceInterface> gazetaService = OCMProtocolMock(@protocol(NewsServiceInterface));
    id<NewsServiceInterface> lentaService = OCMProtocolMock(@protocol(NewsServiceInterface));
    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^passedBlock)( NSArray *errorMessages, NSArray *newsItemsNotSorted );
        [invocation getArgument: &passedBlock atIndex: 2];
        BaseNewsItemEntity* news1 = [BaseNewsItemEntity new];
        news1.publishDate = [NSDate date];
        news1.titleNewsItem = @"current";
        passedBlock(nil,@[news1]);
    };
    OCMStub([gazetaService getNewsWithCompletion:[OCMArg any]]).andDo(proxyBlock);
    OCMStub([lentaService getNewsWithCompletion:[OCMArg any]]).andDo(proxyBlock);
    NewsDataManager *manager = [[NewsDataManager alloc] initWithSourceServices:@[gazetaService, lentaService]];
    
    // when
    XCTestExpectation* expectation = [self expectationWithDescription:@"gathered news"];
    [manager fetchNewsWithCompletion:^(NSArray *errorMessages, NSArray *baseNewsEntities) {
        // ensure that both services finished it's task
        OCMVerify([gazetaService getNewsWithCompletion:[OCMArg any]]);
        OCMVerify([lentaService getNewsWithCompletion:[OCMArg any]]);
        XCTAssert(baseNewsEntities.count==2, @"Pass"); // 1 by service
        [expectation fulfill];
    }];

    
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
    
}



@end
