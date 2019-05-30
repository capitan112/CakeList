//
//  OperationQueueManager.h
//  Cake List
//
//  Created by Oleksiy Chebotarov on 26/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperationQueueManager : NSObject

+ (instancetype)sharedInstance;
- (void)addOperation:(NSOperation *)operation;

@end

