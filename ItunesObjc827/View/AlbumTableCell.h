//
//  AlbumTableCell.h
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlbumTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumSubLabel;

+(NSString*)identifier; //static func identifier() -> String
-(void)configureWith:(Album*)album;

@end

NS_ASSUME_NONNULL_END
