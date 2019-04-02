//
//  AppDelegate.m
//  DatabaseDemo
//
//  Created by Apple on 29/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize strPath;
-(void)copyAndPaste{
    
    NSString *str1=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    strPath=[str1 stringByAppendingPathComponent:@"StudentDb.db"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:strPath]) {
        NSString *locale=[[NSBundle mainBundle]pathForResource:@"StudentDB" ofType:@"db"];
        [[NSFileManager defaultManager] copyItemAtPath:locale toPath:strPath error:nil];
    }
    NSLog(@"%@",strPath);
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self copyAndPaste];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
