//
//  ErrorItemPresenter.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import "ErrorItemPresenter.h"

@implementation ErrorItemPresenter
-(instancetype)initWithMessage:(NSString *)message{
    if (self = [super init]) {
        _message = message;
    }
    return self;
}
@end
