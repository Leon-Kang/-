//
//  AppDelegate.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "AppDelegate.h"
#import "KLUITableViewController.h"
#import "KLUINavigationeController.h"
#import "ViewController.h"
#import "KLItemStore.h"

NSString * const KLItemValuePrefsKey = @"NextItemValue";
NSString * const KLItemNamePrefsKey = @"NextItemName";

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)initialize {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *factorySetting = @{KLItemValuePrefsKey:@75,
                                     KLItemNamePrefsKey:@"Coffee Cup"};
    [defaults registerDefaults:factorySetting];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    KLUITableViewController *tabelViewController = [[KLUITableViewController alloc] init];
    
    tabelViewController.view.backgroundColor = [UIColor clearColor];
    [tabelViewController.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

    ViewController *view = [[ViewController alloc] init];
    view.view.backgroundColor = [UIColor blackColor];
    
    KLUINavigationeController *navController = [[KLUINavigationeController alloc] initWithRootViewController:view];
    
    
    
    
    
    
    self.window.rootViewController = navController;
    
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
    BOOL success = [[KLItemStore sharedStore] savaChanges];
    if (success) {
        NSLog(@"Save all of the KLItems");
    } else {
        NSLog(@"Could not save any of the KLItems");
    }
    
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
