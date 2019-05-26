//
//  Presenter.h
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CakeInfo.h"
@protocol ViewControllerProtocol;

@protocol PresenterProtocol

@property (weak, nonatomic) id <ViewControllerProtocol> viewController;

- (void)getDataFromWebService;
- (void)downloadImageWithCakeInfo:(CakeInfo *)cakeInfo completionBlock: (void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end

@interface Presenter : NSObject <PresenterProtocol>

@property (weak, nonatomic) id <ViewControllerProtocol> viewController ;

- (void)getDataFromWebService;
- (void)downloadImageWithCakeInfo:(CakeInfo *)cakeInfo completionBlock: (void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end

