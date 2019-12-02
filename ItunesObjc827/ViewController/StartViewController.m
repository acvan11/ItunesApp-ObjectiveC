//
//  ViewController.m
//  ItunesObjc827
//
//  Created by mac on 10/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "StartViewController.h"
#import "ListViewController.h"
#import "GridViewController.h"


@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIView *listContainer;
@property (weak, nonatomic) IBOutlet UIView *gridContainer;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO: Add Search Bar
}

- (IBAction)switchButtonTapped:(id)sender {
    [self.listContainer setHidden: ![self.listContainer isHidden]];
    [self.gridContainer setHidden: ![self.gridContainer isHidden]];
}

-(void)setupStart {
    self.viewModel = [ViewModel new]; //var viewModel = ViewModel()
    [self.viewModel getAlbums:@"Michael+Jackson"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier  isEqual: @"ListSegue"]) {
        [self setupStart];
        ListViewController * listVC = segue.destinationViewController;
        listVC.viewModel = self.viewModel;
    }


    if ([segue.identifier  isEqual: @"GridSegue"]) {
        GridViewController * gridVC = segue.destinationViewController;
        gridVC.viewModel = self.viewModel;
    }
}




@end
