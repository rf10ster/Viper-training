//
//  NewsListInteractorInterface.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

@protocol NewsListInteractorInterface <NSObject>

-(void)fetchNewsSortedByPublishDateWithCallback:(void (^)(NSArray *errorMessages,NSArray *newsItemsSorted))newscallback;
@end

