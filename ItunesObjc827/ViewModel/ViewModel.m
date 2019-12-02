//
//  ViewModel.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewModel.h"
#import "ItuneService.h"

@implementation ViewModel


- (void)getAlbums:(NSString*) artistName {
    [ItuneService.sharedInstance getAlbumsFor:artistName completion:^(NSMutableArray<Album *> * _Nonnull albms) {
        
        __weak ViewModel * weakSelf = self; //[weak self] - capture list of weak self - Swift
        weakSelf.albums = albms;

        [NSNotificationCenter.defaultCenter postNotificationName:@"AlbumUpdate" object:nil];
        NSLog(@"Album Count: %lu", albms.count);
    }];
}


@end
