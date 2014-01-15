//
//  MovieViewController.m
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieCastsLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSummaryLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *movieHeader;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"viewDidLoad!  self.movie: %@", self.movie);
    NSLog(@"viewDidLoad!  self.movie.title: %@", self.movie.title);
    self.movieHeader.title = self.movie.title;
    
    NSURL *url = [NSURL URLWithString:self.movie.detailed_url];
    
    [self.posterImageView setImageWithURL:url];
    
    self.movieSummaryLabel.text = self.movie.synopsis;
    
    self.movieCastsLabel.text =  self.movie.getCasts;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
