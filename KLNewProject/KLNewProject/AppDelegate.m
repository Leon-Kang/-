//
//  AppDelegate.m
//  KLNewProject
//
//  Created by 康梁 on 15/11/11.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "AppDelegate.h"
#import "KLViewController.h"
#import "KLRect.h"
#import "KLReminderViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    CGRect frame = [[UIScreen mainScreen] bounds];
//    CGSize size = frame.size;
//    CGPoint point = frame.origin;
    
    
    
    CGRect bounds =  self.window.bounds;
   bounds = CGRectMake(50, 50, 100, 100);
    self.window.bounds = bounds;
    
//    self.window.backgroundColor = [UIColor greenColor];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // self.window = [[UIWindow alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    
//    KLViewController *secondViewController = [[KLViewController alloc] init];
//  
//    self.window.rootViewController = secondViewController;
    
    // secondViewController.view.frame = self.window.frame;
    // secondViewController.view.backgroundColor = [UIColor blueColor];
    // [self.window addSubview:secondViewController.view];
    
    // CGRect firstFrame = CGRectMake(100, 100, 100, 100);
    
//    CGRect screenRect = self.window.bounds;
//    CGRect bigRect = screenRect;
//    // bigRect.size.height *= 2.0;
    // bigRect.size.width *= 2.0;
    
//    UIScrollView *firstView = [[UIScrollView alloc] initWithFrame:screenRect];
//    [firstView setPagingEnabled:YES];
//    [secondViewController.view addSubview:firstView];
    
//    KLRect *KLView = [[KLRect alloc] initWithFrame:screenRect];
//    [firstView addSubview:KLView];
    
//    screenRect.origin.x += screenRect.size.width;
//    KLRect *KLViewTwo = [[KLRect alloc] initWithFrame:screenRect];
//    [firstView addSubview:KLViewTwo];
//    CGFloat x, y, h, w;
//    for (int i = 0; i < 10; i++) {
//        
//    }
    
    

    //处理iOS8本地推送不能收到
    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
    if (sysVersion>=8.0) {
        UIUserNotificationType type=UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
    }
    
    
    KLViewController *rect = [[KLViewController alloc] init];
    rect.view.backgroundColor = [UIColor clearColor];
    
//    KLRect *rectView = [[KLRect alloc] init];
//    [rect.view addSubview:rectView];

    
    KLReminderViewController *reminder = [[KLReminderViewController alloc] initWithNibName:@"KLReminderViewController" bundle:nil];
    

    
    UINavigationController *ReminderNavController = [[UINavigationController alloc] initWithRootViewController:reminder];
    
    UINavigationController *RectNavController = [[UINavigationController alloc] initWithRootViewController:rect];
    
   
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[RectNavController, ReminderNavController];
//
//    // [tabBar.tabBarController setSelectedIndex:0];
//
//    
//    
    self.window.rootViewController = tabBar;
    
//    [.view addSubview:reminder.view];
//    self.window.rootViewController = reminder;

    

    
    
    
//    for (int i = 0; i < 10; i++) {
//        screenRect.origin.x = screenRect.size.width * i;
//        KLRect *klView = [[KLRect alloc] initWithFrame:screenRect];
//        [firstView addSubview:klView];
//        
//        for (int j = 0; j < 10; j++) {
//            screenRect.origin.y = screenRect.size.height * j;
//            KLRect *klViewT = [[KLRect alloc] initWithFrame:screenRect];
//            [firstView addSubview:klViewT];
//        }
//        screenRect.origin.y = 0;
//    }
    // screenRect.origin.x = self.window.bounds.origin.x;
//    for (int j = 0; j < 10; j++) {
//        screenRect.origin.y += screenRect.size.height;
//        KLRect *j = [[KLRect alloc] initWithFrame:screenRect];
//        [firstView addSubview:j];
//    }
    
//    bigRect.size.height += screenRect.size.height * 10;
//    bigRect.size.width = screenRect.size.width * 10;
//    firstView.contentSize = bigRect.size;
//    screenRect.origin.y = screenRect.size.height;
//    KLRect *klViewT = [[KLRect alloc] initWithFrame:screenRect];
//    [firstView addSubview:klViewT];
    
//    for (int j = 0; j < 10; j++) {
//        screenRect.origin.y += screenRect.size.height;
//        KLRect *j = [[KLRect alloc] initWithFrame:screenRect];
//        [firstView addSubview:j];
//    }
    

    
    // KLRect *firstView = [[KLRect alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    firstView.backgroundColor = [UIColor redColor];
    
//    CGRect bounds =  firstView.bounds;
//    bounds = CGRectMake(50, 50, 100, 100);
//    firstView.bounds = bounds;
    
//    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    tView.backgroundColor = [UIColor blackColor];
    
    // [secondViewController.view addSubview:self.window];
    
    
//    [firstView addSubview:tView];
    

    self.window.backgroundColor = [UIColor redColor];
    
    [self.window makeKeyAndVisible];
    
    
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
