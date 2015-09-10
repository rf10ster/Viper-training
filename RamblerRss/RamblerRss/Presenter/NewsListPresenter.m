//
//  NewsListPresenter.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import "NewsListPresenter.h"
#import "BaseNewsItemEntity.h"
@interface NewsListPresenter()
@property (nonatomic,strong) id<NewsListInteractorInterface> interactor;
@end
@implementation NewsListPresenter
-(instancetype)initWithInteractor:(id<NewsListInteractorInterface>)interactor{
    if(self = [super init]){
        _interactor = interactor;
    }
    return self;
}
-(void)updateView{
    __weak typeof (self) wself = self;
    [self.interactor fetchNewsSortedByPublishDateWithCallback:^(NSArray *errorMessages, NSArray *newsItemsSorted) {
        __strong typeof (self) cself = wself;
        if (cself && cself.delegate) {
            NSMutableArray *itemPresenters = [[NSMutableArray alloc] initWithCapacity:newsItemsSorted.count];
            for (BaseNewsItemEntity* item in newsItemsSorted) {
                NewsItemPresenter *itemPresenter = [[NewsItemPresenter alloc] initWithEntity:item];
                [itemPresenters addObject:itemPresenter];
            }
            NSMutableArray *errorPresenters = [[NSMutableArray alloc] initWithCapacity:errorMessages.count];
            for (NSString* message in errorMessages) {
                ErrorItemPresenter *presenter = [[ErrorItemPresenter alloc] initWithMessage:message];
                [errorPresenters addObject:presenter];
            }
            [cself.delegate showNews:itemPresenters errors:errorPresenters];
        }
    }];
}
@end
