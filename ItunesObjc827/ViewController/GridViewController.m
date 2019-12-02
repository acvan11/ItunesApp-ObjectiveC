//
//  GridViewController.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "GridViewController.h"
#import "AlbumCollectionCell.h"
#import "ViewModel.h"
#import "ItunesObjc827-Swift.h"

@interface GridViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *gridCollectionView;


@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGrid];
}

-(void)setupGrid {

    [NSNotificationCenter.defaultCenter addObserverForName:@"AlbumUpdate" object:nil queue: NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        [self.gridCollectionView reloadData];
    }];
}


//MARK: Grid CollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.albums.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AlbumCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AlbumCollectionCell identifier] forIndexPath:indexPath];
    
    Album * album = self.viewModel.albums[indexPath.row];
    [cell configureWith:album];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    double width = (self.view.frame.size.width - 15) / 3;
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Album * album = self.viewModel.albums[indexPath.row];
    WebViewController * webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webVC.album = album;
    [self.navigationController pushViewController:webVC animated:YES];
}


@end
