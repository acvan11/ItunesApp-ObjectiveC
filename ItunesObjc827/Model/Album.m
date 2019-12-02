//
//  Album.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)configureWith:(NSDictionary *)dict {
    
    if ([super init]) {
        
        NSString *name = [dict objectForKey:@"collectionName"];
        NSString *artwork = [dict objectForKey:@"artworkUrl100"];
        NSString *artist = [dict objectForKey:@"artistName"];
        NSString *url = [dict objectForKey:@"artistViewUrl"];
        int collectionId = [[dict objectForKey: @"collectionId"] intValue];
        double price = [[dict objectForKey: @"collectionPrice"] doubleValue];
        
        self.name = name;
        self.artworkUrl = artwork;
        self.artist = artist;
        self.uid = collectionId;
        self.price = price;
        self.url = url;
        
    }
    
    return self;
}



@end
