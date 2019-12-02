//
//  Album.h
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Album : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * artist;
@property (nonatomic, strong) NSString * artworkUrl;
@property (nonatomic, strong) NSString * url;
@property (nonatomic) int uid;
@property (nonatomic) double price;

-(id)configureWith:(NSDictionary*) dict; //can return "-(id)" or "-(instanceType)"



@end

NS_ASSUME_NONNULL_END
