# Network
记得star一下哦

基于原生的NSURLSessionDataTask封装的网络请求组件 
采用block方式回调数据 简单封装了 POST和GET请求(HEAD, TRACE, PUT, DELETE, OPTIONS, CONNECT等 暂未实现)

## 使用

###POST

```
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

```

###GET

```
- (void) testGET {
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

联系我：479003573@qq.com Andyjicw

#TODO
(HEAD, TRACE, PUT, DELETE, OPTIONS, CONNECT等 暂未实现)
