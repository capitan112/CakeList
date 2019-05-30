//
//  ImageDownloader.h
//  Cake List
//
//  Created by Oleksiy Chebotarov on 26/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractOperation.h"
#import "CakeInfo.h"

@interface ImageDownloader : AbstractOperation

- (instancetype)initWithCakeInfo:(CakeInfo *)cakeInfo completion:(void (^)(BOOL succeeded, UIImage *image))completion;

@end

