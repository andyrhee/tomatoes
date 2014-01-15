//
//  Movie.h
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSArray *casts;
@property (nonatomic, strong) NSString *thumbnail_url;
@property (nonatomic, strong) NSString *detailed_url;

- (id)initWithDictionary:(NSDictionary *)Dictionary;
- (NSMutableString *)getCasts;
@end
