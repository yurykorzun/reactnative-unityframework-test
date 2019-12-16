#import "AppDelegate.h"

#import <UnityFramework/UnityFramework.h>
#import <UnityFramework/NativeCallProxy.h>

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

UnityFramework* UnityFrameworkLoad()
{
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];
    
    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) {
      [bundle load];
    }
    
    UnityFramework* ufw = [bundle.principalClass getInstance];
    UnityAppController* appController = [ufw appController];
    if (!appController)
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }
    return ufw;
}

NSDictionary* appLaunchOpts;
// keep arg for unity init from non main
int gArgc = 0;
char** gArgv = NULL;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  appLaunchOpts = launchOptions;
  
  [self initUnity];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"LibraryTestRN"
                                            initialProperties:nil];

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  UIViewController *rootViewController = [UIViewController new];
  self.navController = [[UINavigationController alloc]initWithRootViewController:rootViewController];
  
  //self.navController.navigationBarHidden = YES;
  rootViewController.view = rootView;
  
  self.window.rootViewController = self.navController;
  [self.window makeKeyAndVisible];

  
  return YES;
}

- (void)didFinishLaunching:(NSNotification*)notification {

}
- (void)didBecomeActive:(NSNotification*)notification {

}
- (void)willResignActive:(NSNotification*)notification {
  
}
- (void)didEnterBackground:(NSNotification*)notification {
  
}
- (void)willEnterForeground:(NSNotification*)notification {
  
}
- (void)willTerminate:(NSNotification*)notification {
  
}
- (void)unityDidUnloaded:(NSNotification*)notification {
  
}

- (bool)unityIsInitialized
{
    return [self ufw] && [[self ufw] appController];  
}

- (void)initUnity
{
    if([self unityIsInitialized]) {
        NSLog(@"Unity already initialized, Unload Unity first");
        return;
    }
    
    [self setUfw: UnityFrameworkLoad()];
    // Set UnityFramework target for Unity-iPhone/Data folder to make Data part of a UnityFramework.framework and uncomment call to setDataBundleId
    // ODR is not supported in this case, ( if you need embedded and ODR you need to copy data )
    [[self ufw] setDataBundleId: "com.unity3d.framework"];
    [[self ufw] registerFrameworkListener: self];
    [NSClassFromString(@"FrameworkLibAPI") registerAPIforNativeCalls:self];
    
    [[self ufw] runEmbeddedWithArgc: gArgc argv: gArgv appLaunchOpts: appLaunchOpts];
}

- (void)ShowMainView
{
    if(![self unityIsInitialized]) {
        NSLog(@"Unity is not initialized Initialize Unity first");
    } else {
      UIWindow* unityWindow = [[[self ufw] appController] window];
      
      CGRect viewRect = CGRectMake(self.window.rootViewController.view.frame.origin.x+500, self.window.rootViewController.view.frame.origin.y, self.window.rootViewController.view.frame.size.width, self.window.rootViewController.view.frame.size.height);
      CGRect endViewRect = CGRectMake(self.window.rootViewController.view.frame.origin.x, self.window.rootViewController.view.frame.origin.y, self.window.rootViewController.view.frame.size.width, self.window.rootViewController.view.frame.size.height);
      
      UIView* unityView = [[[self ufw] appController] rootView];
      unityView.frame = viewRect;
      [unityWindow makeKeyAndVisible];
      
      [UIView animateWithDuration:0.5 animations:^{
          unityView.frame = endViewRect;
      }
       completion:^(BOOL finished) {

       }];
    }
}

- (void)showHostMainWindow
{
    UIView* unityView = [[[self ufw] appController] rootView];
    
    CGRect endViewRect = CGRectMake(unityView.frame.origin.x+500, unityView.frame.origin.y, unityView.frame.size.width, unityView.frame.size.height);
    
    [UIView animateWithDuration:0.5 animations:^{
        unityView.frame = endViewRect;
    }
     completion:^(BOOL finished) {
        [self.window makeKeyAndVisible];
     }];

}


- (void)sendMsgToUnity
{
    [[self ufw] sendMessageToGOWithName: "Cube" functionName: "ChangeColor" message: "yellow"];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end

int main(int argc, char * argv[]) {
  gArgc = argc;
  gArgv = argv;
  
  @autoreleasepool {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
