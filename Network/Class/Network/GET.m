//
//  GET.m
//  Network
//
//  Created by andy on 16/6/8.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "GET.h"

@implementation GET

+ (void) withUrl:(NSString *)url
         success:(SuccessBlock)success
         failure:(FailureBlock)failure {
    [GET withUrl:url
            head:nil
         success:^(id result) {
             success(result);
         }
         failure:^(NSError *error) {
             failure(error);
         }];
}

+ (void) withUrl:(NSString *)url
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
     *  请求方式为GET
     */
    [req setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(error);
            }
            return;
        }
        if (success) {
            
            NSString * newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@" GET_请求的URL ： ==>%@<==\n", url);
            NSLog(@" GET_响应字符串(JSON) ： ==>%@<==\n", newStr);
            NSError *jsonError;
            NSData *objectData = [newStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            if (jsonError) {
                NSLog(@" GET_JSON 解析失败ERROR ： ==>%@<==\n", jsonError);
                failure(jsonError);
                return;
            }
            success(json);
        }
    }];
    
    [task resume];
}
@end
