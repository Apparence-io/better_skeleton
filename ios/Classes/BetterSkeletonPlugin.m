#import "BetterSkeletonPlugin.h"
#if __has_include(<better_skeleton/better_skeleton-Swift.h>)
#import <better_skeleton/better_skeleton-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "better_skeleton-Swift.h"
#endif

@implementation BetterSkeletonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBetterSkeletonPlugin registerWithRegistrar:registrar];
}
@end
