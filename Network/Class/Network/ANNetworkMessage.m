//
//  ANNetworkMessage.m
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 22/09/2016.
//  Copyright © 2016 andy. All rights reserved.
//

#import "ANNetworkMessage.h"

@implementation ANNetworkMessage

@end

@implementation POST

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:body
                     head:nil
                   method:ANPOST
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:body
                     head:head
                   method:ANPOST
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

@end

@implementation GET

+ (void)withUrl:(NSString *)url
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:nil
                     head:nil
                   method:ANGET
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

+ (void)withUrl:(NSString *)url
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:nil
                     head:head
                   method:ANGET
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

@end

@implementation PUT

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:body
                     head:nil
                   method:ANPUT
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

+ (void)withUrl:(NSString *)url
           body:(NSMutableDictionary *)body
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:body
                     head:head
                   method:ANPUT
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

@end


@implementation HEAD

+ (void)withUrl:(NSString *)url
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:nil
                     head:nil
                   method:ANHEAD
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

+ (void)withUrl:(NSString *)url
           head:(NSMutableDictionary *)head
        success:(SuccessBlock)success
        failure:(FailureBlock)failure {
    [ANNetworking withUrl:url
                     body:nil
                     head:head
                   method:ANHEAD
                  success:^(id result) {
                      success(result);
                  }
                  failure:^(NSError *error) {
                      failure(error);
                  }];
}

@end
