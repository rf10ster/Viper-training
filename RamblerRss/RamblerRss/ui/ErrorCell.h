//
//  ErrorCell.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ErrorItemPresenter;
@interface ErrorCell : UITableViewCell
@property (nonatomic,strong) ErrorItemPresenter *presenter;
@end
