#import <Cordova/CDV.h>

@interface Adsync2P : CDVPlugin

- (void) showAdsyncList:(CDVInvokedUrlCommand*)command;
- (void) setUserId:(CDVInvokedUrlCommand*)command;

@end