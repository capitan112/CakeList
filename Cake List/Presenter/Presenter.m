//
//  Presenter.m
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import "Presenter.h"
#import "NetworkService.h"
#import "MasterViewController.h"
#import "OperationQueueManager.h"
#import "ImageDownloader.h"

static NSString *url =
@"https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json";

@implementation Presenter

- (void)getDataFromWebService {
    __typeof(self) __weak weakSelf = self;
    [[NetworkService sharedInstance] fetchDataFromURL:url withCompletionBlock:^(NSArray *cakeInfo, NSError *error) {
        if (!error) {
            weakSelf.viewController.cakeInfoArray = [self dataHandler:cakeInfo];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.viewController reloadTableView];
            });
        } else {
            NSLog(@"issue with cakeInfo %@", error);
        }
    }];
}

// It can be class Parser
- (NSArray*)dataHandler:(NSArray*) array {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *dict in array) {
        CakeInfo *cakeInfo = [[CakeInfo alloc] initWithTitle:dict[@"title"] description:dict[@"desc"] imageURL:dict[@"image"]];
        [dictionary setValue:cakeInfo forKey:dict[@"image"]];
    }
    
    return [dictionary allValues];
}

- (void)downloadImageWithCakeInfo:(CakeInfo *)cakeInfo completionBlock: (void (^)(BOOL succeeded, UIImage *image))completionBlock {
        ImageDownloader *imageDownloader = [[ImageDownloader alloc] initWithCakeInfo:cakeInfo completion: ^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                completionBlock(YES, image);
            } else {
                completionBlock(NO, nil);
            }
        }];

        [[OperationQueueManager  sharedInstance] addOperation:imageDownloader];
}

@end
