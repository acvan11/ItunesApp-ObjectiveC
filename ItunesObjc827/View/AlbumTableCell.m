//
//  AlbumTableCell.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "AlbumTableCell.h"
#import "CacheManager.h"

@implementation AlbumTableCell

+(NSString*)identifier {
    return @"AlbumTableCell";
}

-(void)configureWith:(Album*) album {
    
    [CacheManager.sharedInstance downloadFrom:album.artworkUrl completion:^(NSData * data) {
        if (data) {
            UIImage * image = [UIImage imageWithData:data];
            self.albumImage.image = image;
        }
    }];
    
    self.albumMainLabel.text = album.name;
    self.albumSubLabel.text = album.artist;
}

@end
