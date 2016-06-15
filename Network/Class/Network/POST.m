//
//  POST.m
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/8.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "POST.h"

@implementation POST

+ (void) withUrl:(NSString *)url
            body:(NSMutableDictionary *)body
         success:(SuccessBlock)success
         failure:(FailureBlock)failure {
    
    [POST withUrl:url
             body:body
             head:nil
          success:^(id result) {
              success(result);
          }
          failure:^(NSError *error) {
              failure(error);
          }];
}

+ (void) withUrl:(NSString *)url
            body:(NSMutableDictionary *)body
            head:(NSMutableDictionary *)head
         success:(SuccessBlock)success
         failure:(FailureBlock)failure {
    
    NSURL *updateUrl         = [NSURL URLWithString:url];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:updateUrl];
    /**
     *  默认超时时间60s
     */
    req.timeoutInterval      = 60;
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (head) {
        for (NSString *key in head) {
            [req setValue:head[key] forHTTPHeaderField:key];
        }
    }
    /**
     *  将请求体转化为JSON格式
     */
    NSString *str;
    if (body) {
        
        NSError *parseError;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&parseError];
        str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    [req setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    /**
     *  请求方式为POST
     */
    [req setHTTPMethod:@"POST"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                NSLog(@" POST请求的URL : ==>%@<==\n", url);
                NSLog(@" POST请求参数(JOSN) : ==>%@<==\n", str);
                NSLog(@" POST_ERROR : ==>%@<==", error);
                failure(error);
            }
            return;
        }
        if (success) {
            
            NSString * newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@" POST请求的URL : ==>%@<==\n", url);
            NSLog(@" POST请求参数(JOSN) : ==>%@<==\n", str);
            NSLog(@" POST响应字符串(JOSN) : ==>%@<==\n", newStr);
            NSError *jsonError;
            NSData *objectData = [newStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            if (jsonError) {
                NSLog(@" POST_JSON 解析失败ERROR : ==>%@<==\n", jsonError);
                failure(jsonError);
                return;
            }
            success(json);
        }
    }];
    
    [task resume];
}

@end
