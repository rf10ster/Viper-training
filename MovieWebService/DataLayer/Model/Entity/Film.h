//
//  Film.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Actor.h"
#import "Director.h"

typedef enum {
    G = 0,
    PG,
    PG13,
    R,
    NC17
} FilmRating;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject

@property (nonatomic, assign, readonly) FilmRating filmRating;
@property (nonatomic, strong, readonly) NSArray<NSString *> *languages;
@property (nonatomic, assign, readonly) BOOL nominated;
@property (nonatomic, strong, readonly) NSDate *releaseDate;
@property (nonatomic, strong, readonly) NSArray<Actor *> *cast;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) double rating;
@property (nonatomic, strong, readonly) Director *director;

- (id)initWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
