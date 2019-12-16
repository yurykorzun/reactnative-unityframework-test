#import <React/RCTBridgeModule.h>
#import "AppDelegate.h"

@interface LibraryTestRNModule : NSObject <RCTBridgeModule>
@end

@implementation LibraryTestRNModule

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(FirstAction)
{
  AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
  
  [appDelegate ShowMainView];
}

RCT_EXPORT_METHOD(SecondAction)
{
   
}

@end
