//
//  OCUtils.m
//  iOSFastDevTools
//
//  Created by zcw on 2018/5/8.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import "OCUtils.h"
#import <AFNetwork/AFNetwork.h>
@implementation OCUtils

+ (void)testAF{
    // https://github.com/AFNetworking/AFNetworking
    NSString *URLString = @"http://example.com";
    NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];

    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
