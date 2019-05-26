//
//  CakeCell.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "CakeCell.h"

@interface CakeCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cakeImageView;

@end

@implementation CakeCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.cakeImageView.layer.cornerRadius = 5;
    self.cakeImageView.layer.masksToBounds = YES;
}

- (void)configCellWith:(CakeInfo *)cakeInfo {
    self.titleLabel.text = cakeInfo.title;
    self.descriptionLabel.text = cakeInfo.descr;
}

- (void)addImage:(UIImage *)image {
    self.cakeImageView.image = image;
}

@end
