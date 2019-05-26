//
//  CakeInfo.m
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import "CakeInfo.h"

@implementation CakeInfo

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)descr imageURL:(NSString *)imageURL {
    self = [super init];
    if (self) {
        self.title = title;
        self.descr = descr;
        self.imageURL = imageURL;
        self.isLoadedImage = NO;
    }
    
    return self;
}
@end
