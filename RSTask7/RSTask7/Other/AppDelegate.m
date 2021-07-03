//
//  AppDelegate.m
//  RSTask7
//
//  Created by Admin on 02.07.2021.
//

#import "AppDelegate.h"
#import "MainController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        MainController* rootVC = [[MainController alloc] initWithNibName:@"MainController" bundle:nil];
        window.rootViewController = rootVC;
        self.window = window;
        [window makeKeyAndVisible];
        return YES;
}

@end
