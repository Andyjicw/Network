//
//  ANNetworking.m
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 22/09/2016.
//  Copyright © 2016 andy. All rights reserved.
//

#import "ANNetworking.h"

@implementation ANNetworking

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
         method:(ANRequestMethod)method
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    NSURL *updateUrl         = [NSURL URLWithString:url];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:updateUrl];
    req.timeoutInterval      = 60;
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (head) {
        for (NSString *key in head) {
            [req setValue:head[key] forHTTPHeaderField:key];
        }
    }
    NSString *str;
    if (body) {
        NSError *parseError;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&parseError];
        str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    [req setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    switch (method) {
        case 0:
            [req setHTTPMethod:@"POST"];
            break;
        case 1:
            [req setHTTPMethod:@"GET"];
            break;
        case 2:
            [req setHTTPMethod:@"PUT"];
            break;
        case 3:
            [req setHTTPMethod:@"HEAD"];
            break;
        default:
            [req setHTTPMethod:@"GET"];
            break;
    }
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                NSLog(@" 请求的URL : ==>%@<==\n", url);
                NSLog(@" 请求参数(JOSN) : ==>%@<==\n", str);
                NSLog(@" ERROR : ==>%@<==", error);
                failure(error);
            }
            return;
        }
        if (success) {
            NSString * newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (method == ANHEAD) {
                if ([(NSHTTPURLResponse *)response allHeaderFields]) {
                    success([(NSHTTPURLResponse *)response allHeaderFields]);
                    return;
                }
            }
            NSError *jsonError;
            NSData *objectData = [newStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonError];
            if (jsonError) {
                NSLog(@" 请求的URL : ==>%@<==\n", url);
                NSLog(@" 请求参数(JOSN) : ==>%@<==\n", str);
                NSLog(@" 响应字符串(JOSN) : ==>%@<==\n", newStr);
                NSLog(@" JSON 解析失败ERROR : ==>%@<==\n", jsonError);
                failure(jsonError);
                return;
            }
            success(json);
        }
    }];
    [task resume];
}

@end
