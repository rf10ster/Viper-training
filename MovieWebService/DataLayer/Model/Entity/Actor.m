//
//  Actor.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Actor.h"

@interface Actor()

@property (nonatomic, strong) NSString *screenName;

@end

@implementation Actor

- (id)initWithData:(NSDictionary *)data {
    self = [super initWithData:data];
    if (self) {
        self.screenName = [data objectForKey:@"screenName"];
    }
    return self;
}

@end
