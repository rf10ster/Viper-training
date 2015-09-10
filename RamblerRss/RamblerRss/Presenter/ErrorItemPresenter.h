//
//  ErrorItemPresenter.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorItemPresenter : NSObject
@property (nonatomic,copy) NSString *message;
-(instancetype)initWithMessage:(NSString *)message;
@end
