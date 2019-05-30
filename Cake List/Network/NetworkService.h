//
//  NetworkService.h
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkService : NSObject

+ (NetworkService *)sharedInstance;
- (void) fetchDataFromURL:(NSString*)urlStr withCompletionBlock:(void(^)(NSArray *cakeInfoArray, NSError *error)) completionBlock;
- (void)downloadImageWithURL:(NSString *)urlStr completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end


