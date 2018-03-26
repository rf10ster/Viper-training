//
//  GenericRole.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Film;

@interface GenericRole : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *biography;
@property (nonatomic, strong, readonly) NSDate *dateOfBirth;
@property (nonatomic, assign, readonly) BOOL nominated;

- (id)initWithData:(NSDictionary *)data;

@end
