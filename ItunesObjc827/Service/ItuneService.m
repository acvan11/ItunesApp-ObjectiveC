//
//  ItuneService.m
//  ItunesObjc827
//
//  Created by mac on 10/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ItuneService.h"

@implementation ItuneService


//MARK: How To Make a Singleton

+ (instancetype)sharedInstance {
    
    static ItuneService * shared;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        shared = [ItuneService new];
    });
    
    return shared;
}

- (void)getAlbumsFor:(NSString *)artistName completion:(void (^)(NSMutableArray<Album *> * _Nonnull))completion {
    
    NSString *endpoint = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=album", artistName];
    NSURL * url = [[NSURL alloc] initWithString:endpoint];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", [error localizedRecoverySuggestion]);
        }
        
        if (data != nil) {
            
            NSDictionary * jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray * results = [jsonResponse objectForKey:@"results"];
            
            NSMutableArray * albums = [NSMutableArray new];
            
            for (NSDictionary * dict in results) {
                Album * album = [[Album alloc] configureWith:dict];
                [albums addObject:album];
            }
            
            completion(albums);
            
        }
    }] resume];
    

}




@end
