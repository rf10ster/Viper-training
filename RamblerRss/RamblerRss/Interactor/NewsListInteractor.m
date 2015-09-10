//
//  NewsListInteractor.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import "NewsListInteractor.h"
#import "BaseNewsItemEntity.h"
@interface NewsListInteractor()
@property (nonatomic, strong) id<NewsDataManagerInterface> dataManager;
@end

@implementation NewsListInteractor
-(instancetype)initWithDataManager:(id<NewsDataManagerInterface>)newsDataManager{
    if (self=[super init]) {
        _dataManager = newsDataManager;
    }
    return self;
}
-(void)fetchNewsSortedByPublishDateWithCallback:(void (^)(NSArray *errorMessages,NSArray *newsItemsSorted))newscallback{
    [self.dataManager fetchNewsWithCompletion:^(NSArray *errorMessages, NSArray *baseNewsEntities) {
        if (newscallback) {
            NSArray *sortedNews = [baseNewsEntities sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                NSDate *first = [(BaseNewsItemEntity*)a publishDate];
                NSDate *second = [(BaseNewsItemEntity*)b publishDate];
                return [second compare:first];
            }];
            newscallback(errorMessages,sortedNews);
        }
    }];
}
@end
