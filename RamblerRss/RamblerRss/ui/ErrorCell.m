//
//  ErrorCell.m
//  RamblerRss
//
//  Created by Aleksey Kiselev on 10/09/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//

#import "ErrorCell.h"
#import "ErrorItemPresenter.h"
@implementation ErrorCell
-(void)setPresenter:(ErrorItemPresenter *)presenter{
    _presenter = presenter;
    self.textLabel.text = presenter.message;
}
@end
