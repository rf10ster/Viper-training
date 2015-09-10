//
//  NewsItemEntityLentaTests.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NewsItemEntityLenta.h"
@interface NewsItemEntityLentaTests : XCTestCase

@end

@implementation NewsItemEntityLentaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCorrectSourceName {
    // This is an example of a functional test case.
    NewsItemEntityLenta *item = [NewsItemEntityLenta new];
    XCTAssert([item.sourceNewsItem isEqualToString:lentaSourceName], @"wrong source name");
}


@end
