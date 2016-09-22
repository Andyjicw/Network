//
//  GET.h
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/8.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  定义返回block
 */
typedef void(^SuccessBlock)(id result);
typedef void(^FailureBlock)(NSError *error);

@interface GET : NSObject
/**
 *  GET请求（不需要修改请求头）
 *
 *  @param url     请求地址
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;
/**
 *  GET请求（自定义请求头）
 *
 *  @param url     请求地址
 *  @param head    请求头
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;
@end
