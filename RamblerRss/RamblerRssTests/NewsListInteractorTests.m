//
//  NewsListInteractorTests.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsListInteractor.h"
#import "BaseNewsItemEntity.h"

@interface NewsListInteractorTests : XCTestCase
//ioc
@property (nonatomic, strong) id<NewsDataManagerInterface> newsDataManager;
@property (nonatomic, strong) NewsListInteractor *interactor;
@end

@implementation NewsListInteractorTests

- (void)setUp {
    [super setUp];
    self.newsDataManager = OCMProtocolMock(@protocol(NewsDataManagerInterface));
    self.interactor = [[NewsListInteractor alloc] initWithDataManager:self.newsDataManager];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.newsDataManager = nil;
    self.interactor = nil;
}

- (void)testFetchNewsDelegatedToDataManager {
    // given
    //OCMExpect([self.newsDataManager fetchNewsWithCompletion:[OCMArg isNotNil]]);
    
    // when
    [self.interactor fetchNewsSortedByPublishDateWithCallback:^(NSArray *errorMessages, NSArray *newsItemsSorted) {}];
    
    // then
    OCMVerify([self.newsDataManager fetchNewsWithCompletion:[OCMArg isNotNil]]);
}

- (void)testGatherNewsFromSourcesWithCorrectOrder {
    // given
    BaseNewsItemEntity* news1 = [BaseNewsItemEntity new];
    news1.publishDate = [NSDate date];
    news1.titleNewsItem = @"current";
    BaseNewsItemEntity* news2 = [BaseNewsItemEntity new];
    news2.publishDate = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];
    news2.titleNewsItem = @"elder1day";
    NSArray *newsItemsNotSorted = @[news2, news1];
    
    OCMStub([self.newsDataManager fetchNewsWithCompletion:[OCMArg any]])
    .andDo(^(NSInvocation *invocation){
        // block that handles the method invocation
        void (^passedBlock)( NSArray *errorMessages, NSArray *newsItemsNotSorted );
        [invocation getArgument: &passedBlock atIndex: 2];
        
        passedBlock(nil,newsItemsNotSorted);
        
    });
    XCTestExpectation* expectation = [self expectationWithDescription:@"gathered news"];
    
    // when
    [self.interactor fetchNewsSortedByPublishDateWithCallback:^(NSArray *errorMessages, NSArray *newsItemsSorted) {
        //NSString *msg = [errorMessages componentsJoinedByString:@"; "];
        XCTAssert(newsItemsSorted.count==2, @"wrong list fetched");
        XCTAssertEqualObjects(newsItemsSorted[0], news1, @"more recent news item should be first");
        [expectation fulfill];
    }];
    
    // then
    OCMVerify([self.newsDataManager fetchNewsWithCompletion:[OCMArg any]]);
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}





@end
