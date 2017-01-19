#import "Adsync2P.h"
#import "AdsyncWall.h"

@implementation Adsync2P

extern NSString*  sCustId=@"";

- (void)showAdsyncList:(CDVInvokedUrlCommand*)command
{

    NSString* title = [[command arguments] objectAtIndex:0];


    if(sCustId.length == 0){

        NSString* msg = [NSString stringWithFormat: @"Please set UserId"];

        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_ERROR
                                   messageAsString:msg];

        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

    }else{

        AdsyncWall *wall  = [[AdsyncWall alloc]init];
        //    wall.view.backgroundColor = [UIColor blackColor];
        //    [self.viewController presentViewController:wall animated:YES completion:nil];

        [self.viewController addChildViewController:wall];
        [wall showAdsyncWall:sCustId :title];

        NSString* msg = [NSString stringWithFormat: @"Done"];

        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   messageAsString:msg];

        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
}

- (void)setUserId:(CDVInvokedUrlCommand*)command{



    NSString* userId = [[command arguments] objectAtIndex:0];

    if(userId.length == 0){

        NSString* msg = [NSString stringWithFormat: @"Please pass UserId"];

        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_ERROR
                                   messageAsString:msg];

        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

    }else{
        sCustId = userId;

        NSString* msg = [NSString stringWithFormat: @"Done"];

        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   messageAsString:msg];

        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
}

@end
