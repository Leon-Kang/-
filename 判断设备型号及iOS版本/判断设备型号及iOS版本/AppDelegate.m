//
//  AppDelegate.m
//  判断设备型号及iOS版本
//
//  Created by 康梁 on 15/11/5.
//  Copyright © 2015年 kl. All rights reserved.
//
/*
 //下面是ios内其他相关信息的判断方法
 获取进程信息和设备信息（包括设备类型，序列号，ios版本等）
 [[NSProcessInfo processInfo] globallyUniqueString],
 [[NSProcessInfo processInfo] hostName],
 [[NSProcessInfo processInfo] operatingSystemName],
 [[NSProcessInfo processInfo] operatingSystemVersionString],
 [[NSProcessInfo processInfo] physicalMemory],
 [[NSProcessInfo processInfo] processName]);
 ——————————————————————————————
 [UIDevice currentDevice].uniqueIdentifier,
 [UIDevice currentDevice].name,
 [UIDevice currentDevice].systemName,
 [UIDevice currentDevice].systemVersion,
 [UIDevice currentDevice].model,
 [UIDevice currentDevice].localizedModel,
 [UIDevice currentDevice].batteryLevel
 ___________________________________________________
 NSLog([[UIDevice currentDevice] name]); // Name of the phone as named by user
 NSLog([[UIDevice currentDevice] uniqueIdentifier]); // A GUID like string
 NSLog([[UIDevice currentDevice] systemName]); // "iPhone OS"
 NSLog([[UIDevice currentDevice] systemVersion]); // "2.2.1"
 NSLog([[UIDevice currentDevice] model]); // "iPhone" on both devices
 NSLog([[UIDevice currentDevice] localizedModel]); // "iPhone" on both devices
 */



#import "AppDelegate.h"
#import "sys/utsname.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark -----判断设备型号.方法一
// 在网上又找到另外一种方法：
+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#pragma mark -----判断设备型号.方法二
    // 1.在程序中涉及到全屏的宽高的时候，初始化的时候，代码中不要写320和480
#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width
    
    // 2.使用宏定义方法判断
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
    
    if (iPhone5) {
        NSLog(@"It's iphone5");
    }else{
        NSLog(@"It's not iphone5");
    }

    
#pragma mark -------试写判断iOS版本代码
    
    float version = [[[UIDevice currentDevice] systemVersion]floatValue];
    NSLog(@"%f",version);
    
    // 1.可以使用。2.为啥要用floatValue？是强转属性还是按float分配空间
    
        
    return YES;
}

#pragma mark -------判断iOS版本

- (void)getIOSVersion
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 50000    //此方法和编译器相关
int iOSVersion = 1;
#endif
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 5.0)
    {
        iOSVersion = 1;//定义全局变量标记ios版本
    }
}

//-(void)getIOSModel
//{
//    CGSize sizeToRequest;
//    if([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location== 0)
//        sizeToRequest = CGSizeMake(748, 110);
//    else
//        sizeToRequest = CGSizeMake(320, 48);
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
