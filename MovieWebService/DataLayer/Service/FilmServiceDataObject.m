//
//  FilmServiceDataObject.m
//  MovieWebService
//
//  Created by Aleksey Kiselev on 11/14/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "FilmServiceDataObject.h"

@implementation FilmServiceDataObject
- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = @{
                 @"filmRating" : @3,
                 @"languages": @[
                         @"English",
                         @"Thai"
                         ],
                 @"nominated": @1,
                 @"releaseDate": @1350000000,
                 @"cast": @[
                         @{
                             @"dateOfBirth": @-436147200,
                             @"nominated": @1,
                             @"name": @"Bryan Cranston",
                             @"screenName": @"Jack Donnell",
                             @"biography": @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
                             }
                         ],
                 @"name": @"Argo",
                 @"rating": @7.8,
                 @"director": @{
                         @"dateOfBirth": @82684800,
                         @"nominated": @1,
                         @"name": @"Ben Affleck",
                         @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                         }
                 };
    }
    return self;
}
@end
