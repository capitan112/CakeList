//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "Presenter.h"
#import "CakeCell.h"

@interface MasterViewController ()

@property (strong, nonatomic) id <PresenterProtocol> presenter;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.refreshControl.backgroundColor = [UIColor lightGrayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self action:@selector(refreshOptions) forControlEvents:UIControlEventValueChanged];
    self.presenter = [[Presenter alloc] init];
    [self.presenter setViewController:self];
    [self.presenter getDataFromWebService];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cakeInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CakeCell";
    
    CakeCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath:indexPath];
    }
    
    CakeInfo *cakeInfo = (CakeInfo *)self.cakeInfoArray[indexPath.row];
    [cell configCellWith: cakeInfo];
    if (cakeInfo.isLoadedImage) {
        if (cakeInfo.image) {
            [cell addImage: cakeInfo.image];
        } 
    } else {
        [self.presenter downloadImageWithCakeInfo:cakeInfo completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cakeInfo.image = image;
                    cakeInfo.isLoadedImage = YES;
                    [cell addImage: image];
                });
            } else {
                NSLog(@"not succeed loading image");
            }
        }];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - ViewControllerProtocol

- (void)reloadTableView {
    [self.tableView reloadData];
    if (self.refreshControl) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        [self.refreshControl endRefreshing];
    }
}

#pragma mark - TableView refresh

- (void)refreshOptions {
    [self.presenter getDataFromWebService];
}

@end
