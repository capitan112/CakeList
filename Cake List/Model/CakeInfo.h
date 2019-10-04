//
//  CakeInfo.h
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CakeInfo : NSObject

@property (nonatomic, strong, nonnull) NSString *title;
@property (nonatomic, strong, nonnull) NSString *descr;
@property (nonatomic, strong, nonnull) NSString *imageURL;
@property (nonatomic, strong, nonnull) UIImage  *image;

- (instancetype _Nullable)initWithTitle:(NSString *_Nullable)title description:(NSString *_Nullable)descr imageURL:(NSString *_Nullable)imageURL;

@end
