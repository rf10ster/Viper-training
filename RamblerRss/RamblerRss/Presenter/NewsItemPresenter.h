//
//  NewsItemPresenter.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseNewsItemEntity;
@interface NewsItemPresenter : NSObject
@property (nonatomic,assign) BOOL imageLoading;
-(instancetype)initWithEntity:(BaseNewsItemEntity *)entity;
@end
