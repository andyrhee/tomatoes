//
//  Movie.m
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self.title = [dictionary objectForKey:@"title"];
    self.synopsis = [dictionary objectForKey:@"synopsis"];
    self.casts = [dictionary objectForKey:@"abridged_cast"];
    
    //NSLog(@"self.casts in initWithDictionary: %@", self.casts);
    
    NSDictionary *posters = [dictionary objectForKey:@"posters"];
    self.thumbnail_url = [posters objectForKey:@"thumbnail"];
    self.detailed_url = [posters objectForKey:@"detailed"];
    
    return self;
}

- (NSMutableString *)getCasts {
    
    NSMutableString *stringOfcasts;
    stringOfcasts = [NSMutableString stringWithCapacity:50];
    
    
    for (int i = 0 ; i < self.casts.count-1 ; i++) {
        NSDictionary *cast = self.casts[i];
        NSString *actor = [cast objectForKey:@"name"];
        
        NSLog(@"Actor: %@", actor);
        
        [stringOfcasts appendFormat:@"%@, ", actor];
        
        NSLog(@"stringOfcasts: %@", stringOfcasts);
    }
    
    NSDictionary *lastCast = self.casts[self.casts.count-1];
    NSString *actor = [lastCast objectForKey:@"name"];
    [stringOfcasts appendFormat:@"%@.", actor];
    
    return stringOfcasts;

}

@end
