//
//  ItuneService.h
//  ItunesObjc827
//
//  Created by mac on 10/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItuneService : NSObject

+(instancetype)sharedInstance; //static let shared = ItuneService()

// func getAlbumsFor(artistName: String, completion: @escaping ([Album]) -> Void)
-(void)getAlbumsFor:(NSString *) artistName completion: (void(^)(NSMutableArray<Album*>* albums)) completion;

@end

NS_ASSUME_NONNULL_END
