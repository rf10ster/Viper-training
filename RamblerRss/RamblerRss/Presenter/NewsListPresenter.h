//
//  NewsListPresenter.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 21/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorInterface.h"
#import "NewsListUIDelegate.h"
#import "NewsItemPresenter.h"
#import "ErrorItemPresenter.h"
@interface NewsListPresenter : NSObject
@property (nonatomic,strong) NSArray *errorPresenters;
@property (nonatomic,strong) NSArray *newsItemsPresenters;
@property (nonatomic, weak) id <NewsListUIDelegate> delegate;
-(instancetype)initWithInteractor:(id<NewsListInteractorInterface>)newsinteractor;
-(void)updateView;
@end
