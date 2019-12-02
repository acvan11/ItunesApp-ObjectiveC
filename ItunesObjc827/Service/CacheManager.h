//
//  CacheManager.h
//  ItunesObjc827
//
//  Created by mac on 10/9/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CacheManager : NSObject

@property (nonatomic, strong) NSCache * cache;

+(instancetype)sharedInstance;
//func downloadFrom(endpoint: String, completion: @escaping (Data) -> Void)
-(void)downloadFrom:(NSString*)endpoint completion: (void (^)(NSData*)) completion;


@end

NS_ASSUME_NONNULL_END
