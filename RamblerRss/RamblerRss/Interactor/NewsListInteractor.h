//
//  NewsListInteractor.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDataManagerInterface.h"
#import "NewsListInteractorInterface.h"
@interface NewsListInteractor : NSObject<NewsListInteractorInterface>
-(instancetype)initWithDataManager:(id<NewsDataManagerInterface>)newsDataManager;
//callback for interactor's delegate, i.e. for presenter
-(void)fetchNewsSortedByPublishDateWithCallback:(void (^)(NSArray *errorMessages,NSArray *newsItemsSorted))newscallback;
@end
