//
//  GridViewController.h
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
@class WebViewController;

NS_ASSUME_NONNULL_BEGIN

@interface GridViewController : UIViewController<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) ViewModel * viewModel;

@end

NS_ASSUME_NONNULL_END
