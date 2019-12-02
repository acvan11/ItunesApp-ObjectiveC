//
//  CacheManager.m
//  ItunesObjc827
//
//  Created by mac on 10/9/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager


+ (instancetype)sharedInstance {
    
    static CacheManager* shared;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        shared = [CacheManager new];
    });
    
    return shared;
}

-(id)init {
    if ([super init]) {
        _cache = [NSCache new];
    }
    
    return self;
}

- (void)downloadFrom:(NSString *)endpoint completion:(void (^)(NSData * _Nonnull))completion {
    
    NSData* data = [self.cache objectForKey:endpoint];
    
    if (data) {
        completion(data);
        return;
    }
    
    NSURL * url = [NSURL URLWithString:endpoint];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            return;
        }
        
        if (data) {
            [self.cache setObject:data forKey:endpoint];
            
            //Go to main thread - Dispatch.main.async() (SWIFT)
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data);
            });
            
            return;
        }
        
    }] resume];

}




@end
