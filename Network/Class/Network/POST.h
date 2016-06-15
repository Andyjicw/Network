//
//  POST.h
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

@interface POST : NSObject
/**
 *  POST请求（不需要修改请求头）
 *
 *  @param url     请求地址
 *  @param body    请求体
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void) withUrl:(NSString *)url
            body:(NSMutableDictionary *)body
         success:(SuccessBlock)success
         failure:(FailureBlock)failure;
/**
 *  POST请求（自定义请求头）
 *
 *  @param url     请求地址
 *  @param body    请求体
 *  @param head    请求头
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void) withUrl:(NSString *)url
            body:(NSMutableDictionary *)body
            head:(NSMutableDictionary *)head
         success:(SuccessBlock)success
         failure:(FailureBlock)failure;

@end
