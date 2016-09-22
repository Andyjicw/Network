//
//  ANNetworking.h
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 22/09/2016.
//  Copyright © 2016 andy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ANRequestMethod) {
    ANPOST = 0,
    ANGET  = 1,
    ANPUT  = 2,
    ANHEAD = 3,
};

/**
 *  定义返回block
 */
typedef void(^SuccessBlock)(id result);
typedef void(^FailureBlock)(NSError *error);

@interface ANNetworking : NSObject

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
         method:(ANRequestMethod)method
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;

@end
