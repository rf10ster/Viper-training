//
//  NewsListUIDelegate.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

@protocol NewsListUIDelegate <NSObject>
- (void)showNews:(NSArray*)items errors:(NSArray*)errorItems;
@end
