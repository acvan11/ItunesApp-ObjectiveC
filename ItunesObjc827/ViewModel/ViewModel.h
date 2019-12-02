//
//  ViewModel.h
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
#import "ViewModelDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

@property (nonatomic, weak) id<ViewModelDelegate> delegate; //weak var delegate: ViewModelDelegate?
@property (nonatomic, strong) NSMutableArray<Album*>* albums; //var albums = [Album]
-(void)getAlbums:(NSString*) artistName; //func getAlbums()


@end

NS_ASSUME_NONNULL_END
