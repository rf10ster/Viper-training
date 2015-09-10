//
//  NewsListPresenterTests.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NewsListPresenter.h"
#import <OCMock/OCMock.h>
#import "NewsListInteractor.h"
#import "NewsListViewController.h"
#import "BaseNewsItemEntity.h"

@interface NewsListPresenterTests : XCTestCase

@end

@implementation NewsListPresenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPresenterTriggerInteractor {
    //given
    id<NewsListInteractorInterface> interactor = OCMProtocolMock(@protocol(NewsListInteractorInterface));
    NewsListPresenter *presenter = [[NewsListPresenter alloc] initWithInteractor:interactor];
    
    //when
    [presenter updateView];
    
    //than
    OCMVerify([interactor fetchNewsSortedByPublishDateWithCallback:[OCMArg any]]);

}

- (void)testPresenterCallsDelegate_prototype {
    //given
    id<NewsListUIDelegate> uidelegate = OCMProtocolMock(@protocol(NewsListUIDelegate));
    id<NewsListInteractorInterface> interactor = OCMProtocolMock(@protocol(NewsListInteractorInterface));
    OCMStub([interactor fetchNewsSortedByPublishDateWithCallback:[OCMArg any]])
    .andCall(uidelegate,@selector(showNews:errors:));
    
    NewsListPresenter *presenter = [[NewsListPresenter alloc] initWithInteractor:interactor];
    
    
    presenter.delegate = uidelegate;
    
    //when
    [presenter updateView];
    
    //then
    OCMVerify([presenter.delegate showNews:[OCMArg any] errors:[OCMArg any]]);
    
}
- (void)testPresenterCallsDelegate {
    //given
    id<NewsListUIDelegate> uidelegate = OCMProtocolMock(@protocol(NewsListUIDelegate));
    id<NewsListInteractorInterface> interactor = OCMProtocolMock(@protocol(NewsListInteractorInterface));
    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^passedBlock)( NSArray *errors, NSArray *newsItems );
        [invocation getArgument: &passedBlock atIndex: 2];
        passedBlock(nil,nil);
    };
    OCMStub([interactor fetchNewsSortedByPublishDateWithCallback:[OCMArg any]])
    .andDo(proxyBlock);
    
    NewsListPresenter *presenter = [[NewsListPresenter alloc] initWithInteractor:interactor];
    
    
    presenter.delegate = uidelegate;
//    OCMExpect([uidelegate showNews:[OCMArg any] errors:[OCMArg any]]);
    
    //when
    [presenter updateView];
    
    //then
    OCMVerify([presenter.delegate showNews:[OCMArg any] errors:[OCMArg any]]);
    
}
// check this on the UI layer
- (void)DISABLED_testPresenterGetsItemPresenters {
    //given
    id<NewsListUIDelegate> uidelegate = OCMProtocolMock(@protocol(NewsListUIDelegate));
    id<NewsListInteractorInterface> interactor = OCMProtocolMock(@protocol(NewsListInteractorInterface));
    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^passedBlock)( NSArray *errors, NSArray *newsItems );
        [invocation getArgument: &passedBlock atIndex: 2];
        BaseNewsItemEntity* news1 = [BaseNewsItemEntity new];
        news1.publishDate = [NSDate date];
        news1.titleNewsItem = @"current";
        passedBlock(@[@"error1"],@[news1]);
    };
    OCMStub([interactor fetchNewsSortedByPublishDateWithCallback:[OCMArg any]])
    .andDo(proxyBlock);
    
    NewsListPresenter *presenter = [[NewsListPresenter alloc] initWithInteractor:interactor];
    
    
    presenter.delegate = uidelegate;
//    OCMExpect([uidelegate showNews:[OCMArg any] errors:[OCMArg any]]);
    
    //when
    [presenter updateView];
    
    //then
    OCMVerify([presenter.delegate
               showNews:[OCMArg checkWithBlock:^BOOL(id value) {
                            id item = ((NSArray *)value).firstObject;
                            return [item isKindOfClass:[NewsItemPresenter class]];
                        }]
               errors:[OCMArg checkWithBlock:^BOOL(id value) {
                            id item = ((NSArray *)value).firstObject;
                            return [item isKindOfClass:[ErrorItemPresenter class]];
                        }]
               ]);
    
}


@end
