//
//  Film.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Film.h"
#import "Actor.h"
#import "Director.h"

@interface Film()

@property (nonatomic, assign) FilmRating filmRating;
@property (nonatomic, strong) NSArray<NSString *> *languages;
@property (nonatomic, assign) BOOL nominated;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSArray<Actor *> *cast;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double rating;
@property (nonatomic, strong) Director *director;

@end

@implementation Film

- (id)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.filmRating = [[data objectForKey:@"filmRating"] doubleValue];
        self.languages = [data objectForKey:@"languages"];
        self.nominated = [[data objectForKey:@"nominated"] boolValue];
        self.releaseDate = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"releaseDate"] doubleValue]];
        
        
        NSArray *castsData = [data objectForKey:@"cast"];
        NSMutableArray *castsList = [[NSMutableArray alloc] initWithCapacity:castsData.count];
        for (NSDictionary *castData in castsData) {
            Actor *actor = [[Actor alloc] initWithData:castData];
            [castsList addObject:actor];
        }
        self.cast = castsList;
        
        self.name = [data objectForKey:@"name"];
        self.rating = [[data objectForKey:@"rating"] doubleValue];
        self.director = [[Director alloc] initWithData:[data objectForKey:@"director"]];
    }
    return self;
}


- (void)setName:(NSString *)name {
    if (name != _name) {
        name = _name;
    }
}

@end
