//
//  ViewController.m
//  Network
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/8.
//  Copyright © 2016年 andy. All rights reserved.
//

#define TEST_URL @"http://www.chedan.org:11111/NetworkDemo.php"

#import "ViewController.h"

#import "POST.h"
#import "GET.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testPOST];
    [self testGET];
}

#pragma mark - testPOST

- (void) testPOST {
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    [body setObject:@"1" forKey:@"page"];
    [POST withUrl:TEST_URL
             body:body
          success:^(id result) {
              // success to do
          }
          failure:^(NSError *error) {
              // failure to do
          }];
}

#pragma mark - testGET

- (void) testGET {
    [GET withUrl:TEST_URL
         success:^(id result) {
             // success to do
         }
         failure:^(NSError *error) {
             // failure to do
         }];
}

@end