//
//  MasterViewController.h
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerProtocol

@property (strong, nonatomic) NSArray *cakeInfoArray;

- (void)reloadTableView;

@end

@interface MasterViewController : UITableViewController <ViewControllerProtocol>

@property (strong, nonatomic) NSArray *cakeInfoArray;

@end

