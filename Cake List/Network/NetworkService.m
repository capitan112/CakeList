//
//  NetworkService.m
//  Cake List
//
//  Created by Oleksiy Chebotarov on 24/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

+ (instancetype)sharedInstance {
    static NetworkService *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[NetworkService alloc] init];
    });
    
    return _sharedInstance;
}

- (void)fetchDataFromURL:(NSString *)urlStr withCompletionBlock:(void(^)(NSArray *cakeInfoArray, NSError *error)) completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    NSLog(@"session error %@", error);
                                                    completionBlock(nil, error);
                                                } else {
                                                    NSArray *cakeInfoArra  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    completionBlock(cakeInfoArra, error);
                                                }
                                            }];
    [dataTask resume];
}

- (void)downloadImageWithURL:(NSString *)urlStr completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    NSLog(@"session error %@", error);
                                                    completionBlock(NO, nil);
                                                } else {
                                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                                    completionBlock(YES, image);
                                                }
                                            }];
    [dataTask resume];
}

@end
