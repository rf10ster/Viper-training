//
//  NewsDataManager.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 26/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDataManagerInterface.h"
@interface NewsDataManager : NSObject<NewsDataManagerInterface>
-(instancetype)initWithSourceServices:(NSArray *)newsServices;
@end