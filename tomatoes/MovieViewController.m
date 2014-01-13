//
//  MovieViewController.m
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieCastsLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSummaryLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *movieHeader;

- (UIImage *)getPoster;
- (NSMutableString *)getCasts;

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
    NSLog(@"%@", @"viewDidLoad");
    NSLog(@"%@", self.movieDictionary);
    
    self.posterImageView.image = self.getPoster;
    
    self.movieHeader.title = [self.movieDictionary objectForKey:@"title"];
    
    self.movieSummaryLabel.text = [self.movieDictionary objectForKey:@"synopsis"];
    
    self.movieCastsLabel.text =  self.getCasts;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableString *)getCasts {
    NSArray *casts = [self.movieDictionary objectForKey:@"abridged_cast"];

    //NSLog(@"%@", casts);

    NSMutableString *stringOfcasts;
    stringOfcasts = [NSMutableString stringWithCapacity:50];

    for (int i = 0 ; i < casts.count-1 ; i++) {
        NSDictionary *cast = casts[i];
        NSString *actor = [cast objectForKey:@"name"];
        
        //NSLog(@"%@: %@", @"Actor", actor);
    
        [stringOfcasts  appendFormat:@"%@, ", actor];
    
        //NSLog(@"%@: %@", @"stringOfcasts", stringOfcasts);
    }
    
    NSDictionary *lastCast = casts[casts.count-1];
    NSString *actor = [lastCast objectForKey:@"name"];
    [stringOfcasts  appendFormat:@"%@.", actor];
    
    return stringOfcasts;

    //NSLog(@"%@", stringOfcasts);
}

- (UIImage *)getPoster {
    NSDictionary *posters = [self.movieDictionary objectForKey:@"posters"];
    // NSLog(@"%@", posters);
    
    NSString *url = [posters valueForKey:@"detailed"];
    
    //NSLog(@"%@", url);
    /*
     dispatch_async(dispatch_get_global_queue(0,0), ^{
     NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
     if ( data == nil )
     return;
     dispatch_async(dispatch_get_main_queue(), ^{
     // WARNING: is the cell still using the same data by this point??
     cell.imageView.image = [UIImage imageWithData: data];
     });
     });
     */
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
    
    return [UIImage imageWithData: imageData];
    
}

@end
