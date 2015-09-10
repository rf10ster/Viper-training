//
//  NewsDataManager.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 26/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import "NewsDataManager.h"
#import "NewsServiceInterface.h"

@interface NewsDataManager()
@property (nonatomic,strong) NSArray *services; // array if id<NewsServiceInterface>
@end

@implementation NewsDataManager
-(instancetype)initWithSourceServices:(NSArray *)newsServices{
    if (self = [super init]) {
        NSAssert(newsServices.count, @"should be at least 1 service");
        _services = newsServices;
    }
    return self;
}
- (void)fetchNewsWithCompletion:(void (^)(NSArray *errorMessages, NSArray *baseNewsEntities))fetchBlock{
    NSMutableArray *totalErrorMessages = [NSMutableArray array];
    NSMutableArray *totalNews = [NSMutableArray array];
    //serial - to thread safe aggreagation values for mutableArrays
    dispatch_queue_t valuesAggregatorQueue = dispatch_queue_create("com.ramblerrss.servicesresponcesaggregatorqueue", NULL);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //fire up block only when all services finished it's tasks
    for (id<NewsServiceInterface> service in self.services) {
        
        [service getNewsWithCompletion:^(NSArray *errorMessages, NSArray *baseNewsEntities) {
            dispatch_async(valuesAggregatorQueue, ^{
                if([errorMessages count]) [totalErrorMessages addObjectsFromArray:errorMessages];
                if([baseNewsEntities count]) [totalNews addObjectsFromArray:baseNewsEntities];
                dispatch_semaphore_signal(semaphore);
            });
        }];
    }
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    if (fetchBlock) {
        fetchBlock(totalErrorMessages,totalNews);
    }
}
@end
