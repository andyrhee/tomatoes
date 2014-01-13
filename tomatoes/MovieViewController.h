//
//  MovieViewController.h
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *movieView;
@property (nonatomic, strong) NSDictionary *movieDictionary;

@end
