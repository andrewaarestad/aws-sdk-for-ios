/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */


#import "Message_BoardAppDelegate.h"
#import "Message_BoardViewController.h"
#import "MessageBoard.h"
#import <AWSiOSSDK/AmazonLogger.h>
#import <AWSiOSSDK/AmazonErrorHandler.h>

@implementation Message_BoardAppDelegate

@synthesize window = _window;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [MessageBoard instance]; // Initialized here to more quickly be available when the app is running.
    
    Message_BoardViewController *boardViewController = [Message_BoardViewController new];
    UINavigationController *navigationController = [UINavigationController new];
    [navigationController pushViewController:boardViewController animated:NO];
    [boardViewController release];

    self.window.rootViewController = navigationController;
    [navigationController release];
    
    [self.window makeKeyAndVisible];
    
    // Logging Control - Do NOT use logging for non-development builds.
#ifdef DEBUG
    [AmazonLogger verboseLogging];
#else
    [AmazonLogger turnLoggingOff];
#endif
    
    [AmazonErrorHandler shouldNotThrowExceptions];
    
    return YES;
}

-(void)applicationWillResignActive:(UIApplication *)application
{
    /*
     * Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     * Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     * Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     * If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     * Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

-(void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     * Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    /*
     * Called when the application is about to terminate.
     * Save data if appropriate.
     * See also applicationDidEnterBackground:.
     */
}

-(void)dealloc
{
    [_window release];
    
    [super dealloc];
}

@end