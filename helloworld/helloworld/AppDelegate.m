//
//  AppDelegate.m
//  helloworld
//
//  Created by 康梁 on 15/11/2.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "AppDelegate.h"
#import "KLHelloWorld.h"
#import "KLCalculator.h"
#import "KLClassA.h"
#import "KLClassB.h"
#import "KLClassC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    KLHelloWorld *helloWorld = [[KLHelloWorld alloc] init];
    
    helloWorld.name = @"Today is Monday";
    
    [helloWorld print:@"kl"];
    
    [helloWorld printName];
    
    helloWorld.value = M_PI;
    NSLog(@"The value is %.2f",helloWorld.value);
    
    [KLHelloWorld sayHello];
    
    KLCalculator *sum = [[KLCalculator alloc] init];
    [sum addition:2 with:3];
    
    float sumDiv = [sum division:2 with:0];
    NSLog(@"%f",sumDiv);
    
    int sumFac = [sum factorial:0];
    NSLog(@"%i",sumFac);
    
    int sumSub = [sum subtract:5 with:2];
    NSLog(@"%i",sumSub);
    
    int sumMul = [sum multiplication:2 with:3];
    NSLog(@"%i",sumMul);
    
    KLClassB *b = [[KLClassB alloc] init];
    [b initVar];
    [b printVar];
    
    KLClassC *c = [[KLClassC alloc] init];
    [c initAndPrint];
    
    c.weight = 12.09;
    c.heihgt = 34.03;
    NSLog(@"%f",[c area:c.weight with:c.heihgt]);
    
    NSString *str1 = @"klasadasdasdsadsadasdasd";
    NSLog(@"%p, %p", &str1, &str1 + 1);
    return YES;
}

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
