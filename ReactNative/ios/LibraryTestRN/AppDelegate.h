#import <UIKit/UIKit.h>
#import <UnityFramework/UnityFramework.h>
#import <UnityFramework/NativeCallProxy.h>
#import <React/RCTBridgeDelegate.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UnityFrameworkListener, NativeCallsProtocol, RCTBridgeDelegate>

@property (nonatomic, strong) UIWindow *window;
@property UnityFramework* ufw;
@property UINavigationController* navController;

- (void)initUnity;
- (void)ShowMainView;
- (void)didFinishLaunching:(NSNotification*)notification;
- (void)didBecomeActive:(NSNotification*)notification;
- (void)willResignActive:(NSNotification*)notification;
- (void)didEnterBackground:(NSNotification*)notification;
- (void)willEnterForeground:(NSNotification*)notification;
- (void)willTerminate:(NSNotification*)notification;
- (void)unityDidUnloaded:(NSNotification*)notification;

@end
