//
//  MovieCell.h
//  tomatoes
//
//  Created by Andy Rhee on 1/11/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *posterThumbnailImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSynopsisLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;

@end
