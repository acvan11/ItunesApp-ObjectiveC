//
//  AlbumCollectionCell.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "AlbumCollectionCell.h"
#import "CacheManager.h"

@implementation AlbumCollectionCell


+ (NSString *)identifier {
    return @"AlbumCollectionCell";
}

- (void)configureWith:(Album *)album {
    
    [CacheManager.sharedInstance downloadFrom:album.artworkUrl completion:^(NSData * data) {
        if (data) {
            UIImage * image = [UIImage imageWithData:data];
            self.albumImage.image = image;
        }
    }];
    
    self.albumTitle.text = album.artist;
}

@end
