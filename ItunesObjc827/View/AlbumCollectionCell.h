//
//  AlbumCollectionCell.h
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlbumCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumTitle;

+(NSString*)identifier;

-(void)configureWith:(Album*) album;

@end

NS_ASSUME_NONNULL_END
