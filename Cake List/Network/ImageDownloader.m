//
//  ImageDownloader.m
//  Cake List
//
//  Created by Oleksiy Chebotarov on 26/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import "ImageDownloader.h"

@interface ImageDownloader ()

@property (strong, nonatomic) CakeInfo *cakeInfo;
@property (nonatomic, copy) void (^completion)(BOOL succeeded, UIImage *image);

@end

@implementation ImageDownloader

- (instancetype)initWithCakeInfo:(CakeInfo *)cakeInfo completion:(void (^)(BOOL succeeded, UIImage *image))completion {
    self = [super init];
    
    if (self) {
        self.cakeInfo = cakeInfo;
        self.completion = completion;
        self.name = @"ImageDownloader";
    }
    
    return self;
}
- (void)start {
    [super start];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString: self.cakeInfo.imageURL];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    NSLog(@"session error %@", error);
                                                    self.completion(NO, nil);
                                                } else {
                                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                                    if (self.completion) {
                                                        self.completion(YES, image);
                                                    }
                                                }
                                            }];
    [dataTask resume];
}


@end
