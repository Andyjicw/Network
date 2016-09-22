//
//  ANNetworkMessage.h
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 22/09/2016.
//  Copyright © 2016 andy. All rights reserved.
//

#import "ANNetworking.h"

/**
 *  定义返回block
 */
typedef void(^SuccessBlock)(id result);
typedef void(^FailureBlock)(NSError *error);

@interface ANNetworkMessage : NSObject

@end

@interface POST : ANNetworkMessage

/**
 *  POST请求（不需要修改请求头）
 *
 *  @param url     请求地址
 *  @param body    请求体
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
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
+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;

@end

@interface GET : ANNetworkMessage

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


/**
 @see http://stackoverflow.com/questions/630453/put-vs-post-in-rest
 */
@interface PUT : ANNetworkMessage

/**
 *  PUT请求（不需要修改请求头）
 *
 *  @param url     请求地址
 *  @param body    请求体
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;
/**
 *  PUT请求（自定义请求头）
 *
 *  @param url     请求地址
 *  @param body    请求体
 *  @param head    请求头
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;

@end

@interface HEAD : ANNetworkMessage

/**
 *  HEAD请求（不需要修改请求头）
 *
 *  @param url     请求地址
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)withUrl:(NSString *)url
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;
/**
 *  HEAD请求（自定义请求头）
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
