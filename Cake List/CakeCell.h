//
//  CakeCell.h
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CakeInfo.h"

@interface CakeCell: UITableViewCell

- (void)configCellWith:(CakeInfo *)cakeInfo;
- (void)addImage:(UIImage *)image;

@end
