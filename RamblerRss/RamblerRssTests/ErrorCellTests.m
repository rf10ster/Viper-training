//
//  ErrorCellTests.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ErrorCell.h"
#import "ErrorItemPresenter.h"

@interface ErrorCellTests : XCTestCase

@end

@implementation ErrorCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetter {
    // given
    NSString *errorMessage = @"test error";
    ErrorItemPresenter *presenter = [[ErrorItemPresenter alloc] initWithMessage:errorMessage];
    ErrorCell *cell = [ErrorCell new];
    //when
    cell.presenter = presenter;
    // then
    XCTAssert([cell.textLabel.text isEqualToString:errorMessage], @"Pass");
}



@end
