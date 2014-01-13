//
//  MovieTableViewController.m
//  tomatoes
//
//  Created by Andy Rhee on 1/10/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MovieViewController.h"
#import "MovieCell.h"

@interface MovieTableViewController ()

@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) NSDictionary *movie;

@end

@implementation MovieTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            self.movies = [object valueForKeyPath:@"movies"];
            
            //NSLog(@"%@", object);
            
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    self.movie = [self.movies objectAtIndex:indexPath.row];
    
    NSArray *casts = [self.movie objectForKey:@"abridged_cast"];
    
    //NSLog(@"%@", casts);
    
    NSMutableString *stringOfcasts;
    stringOfcasts = [NSMutableString stringWithCapacity:50];
    
    for (int i = 0 ; i < casts.count ; i++) {
        NSDictionary *cast = casts[i];
        NSString *actor = [cast objectForKey:@"name"];
        
        //NSLog(@"%@: %@", @"Actor", actor);
        
        [stringOfcasts  appendFormat:@"%@, ", actor];
        
        //NSLog(@"%@: %@", @"stringOfcasts", stringOfcasts);
    }
    
    //NSLog(@"%@", stringOfcasts);
    
    cell.movieTitleLabel.text = [self.movie objectForKey:@"title"];
    cell.movieSynopsisLabel.text = [self.movie objectForKey:@"synopsis"];
    cell.movieCastLabel.text = stringOfcasts;
    
    NSDictionary *posters = [self.movie objectForKey:@"posters"];
    // NSLog(@"%@", posters);
    
    NSString *url = [posters valueForKey:@"thumbnail"];
    
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
    cell.posterThumbnailImageView.image = [UIImage imageWithData: imageData];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    //NSLog(@"sender: %@", sender);
    //NSLog(@"segue id: %@", [segue identifier]);
    
    
    if ([[segue identifier] isEqualToString:@"ShowMovieDetails"]) {
        MovieViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.movieDictionary = [self.movies objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }

}



@end
