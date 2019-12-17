#import <Foundation/Foundation.h>
#import "NativeCallProxy.h"


@implementation FrameworkLibAPI

id<NativeCallsProtocol> api = NULL;
+(void) registerAPIforNativeCalls:(id<NativeCallsProtocol>) aApi
{
    api = aApi;
}

@end


extern "C" {
    void showHostMainWindow() { return [api showHostMainWindow]; }
    void _TestLibrary_FirstAction()
     {
         [api showHostMainWindow];
     }

     void _TestLibrary_SecondAction()
     {
     }
}

