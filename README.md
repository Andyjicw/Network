#Network
========

基于原生的NSURLSessionDataTask封装的网络请求组件 
采用block方式回调数据 简单封装了 POST、GET、HEAD、PUT请求(TRACE, DELETE, OPTIONS, CONNECT等 暂未实现)

## 使用

###POST

```
- (void)testPOST {
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

```

###GET

```
- (void)testGET {
    [GET withUrl:TEST_URL
        success:^(id result) {
            // success to do
        }
        failure:^(NSError *error) {
            // failure to do
        }];
}

```

欢迎指出问题


#TODO
(TRACE, DELETE, OPTIONS, CONNECT等 暂未实现)

=======================

联系我  : 479003573@qq.com 

github :Andyjicw

=======================
## 须知       
中文：如果您在您的项目中使用该开源组件,请给我们发[电子邮件](mailto:479003573@qq.com?subject=From%20GitHub%20Network)告诉我们您的应用程序的名称。         

## Instructions
         
English：If you use the open source components in your project, please [Email us](mailto:479003573@qq.com?subject=From%20GitHub%20Network) to tell us the name of your application.
