//
//  OperationQueueManager.m
//  Cake List
//
//  Created by Oleksiy Chebotarov on 26/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import "OperationQueueManager.h"

@interface OperationQueueManager ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation OperationQueueManager

#pragma mark - SharedInstance

+ (instancetype)sharedInstance {
    static OperationQueueManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
                      sharedInstance = [[OperationQueueManager alloc] init];
                  });
    
    return sharedInstance;
}

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

#pragma mark - AddOperation

- (void)addOperation:(NSOperation *)operation {
    [self.queue addOperation:operation];
}

@end
