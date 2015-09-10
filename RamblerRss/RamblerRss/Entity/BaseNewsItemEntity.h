//
//  BaseNewsItemEntity.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define lentaSourceName @"lenta.ru"
#define gazetaSourceName @"gazeta.ru"
// simple base DTO - do not use explicitly
@interface BaseNewsItemEntity : NSObject
@property (nonatomic,strong) NSDate *publishDate;
@property (nonatomic,copy) NSString *titleNewsItem;
// not UIImage - dont want include reference to UIKit
@property (nonatomic,copy) NSURL *imageAddress;
// override by inheritor
@property (nonatomic,copy,readonly) NSString *sourceNewsItem;
@end
