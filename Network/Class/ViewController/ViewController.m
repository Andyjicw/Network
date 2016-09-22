//
//  ViewController.m
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/8.
//  Copyright © 2016年 andy. All rights reserved.
//

#define TEST_URL @"http://220.231.200.166:8888/NetworkDemo.php"

#import "ViewController.h"
#import "ANNetworkMessage.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testPOST];
    [self testGET];
    [self testPUT];
    [self testHEAD];
}

#pragma mark - testPOST

- (void)testPOST {
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    [body setObject:@"1" forKey:@"page"];
    [POST withUrl:TEST_URL
             body:body
          success:^(id result) {
              NSLog(@" POST : %@", result);
              // success to do
          }
          failure:^(NSError *error) {
              // failure to do
          }];
}

#pragma mark - testGET

- (void)testGET {
    [GET withUrl:TEST_URL
         success:^(id result) {
             NSLog(@" GET : %@", result);
             // success to do
         }
         failure:^(NSError *error) {
             // failure to do
         }];
}

#pragma mark - testPUT

- (void)testPUT {
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    [body setObject:@"1" forKey:@"page"];
    [PUT withUrl:TEST_URL
            body:body
            head:nil
         success:^(id result) {
             NSLog(@" PUT : %@", result);
             // success to do
         }
         failure:^(NSError *error) {
             // failure to do
         }];
}

#pragma mark - testHEAD

- (void)testHEAD {
    [HEAD withUrl:TEST_URL
          success:^(id result) {
              NSLog(@" HEAD : %@", result);
              // success to do (result is header)
          }
          failure:^(NSError *error) {
              // failure to do
          }];
}

@end
