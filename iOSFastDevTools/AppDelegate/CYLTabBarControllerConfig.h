//
//  CYLTabBarControllerConfig.h
//  iOSFastDevTools
//
//  Created by zcw on 2018/3/1.
//  Copyright © 2018年 zcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CYLTabBarController/CYLTabBarController.h>

@interface CYLTabBarControllerConfig : NSObject


@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
