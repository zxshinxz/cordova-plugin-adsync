#import "AdsyncWall.h"
#import "adsync2.h"

#undef UIColorFromRGB
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation AdsyncWall

//- (void)closeAdSyncHandleView {
//    NSLog(@"**** closeAdSyncHandleView ***");
//    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (void) viewDidLoad{
//    [self showAdsyncWall];
//}

- (void) showAdsyncWall:(NSString*) sCustId:(NSString*) title{



    adsync2 *adsync = [adsync2 sharedManager];
    adsync.title = title;
    adsync.titleTextColor = UIColorFromRGB(0xFFFFFF);
    adsync.titleBackgroundColor = UIColorFromRGB(0x999999);
    adsync.parent = self;

    adsync.custAge = 0;
    adsync.custGender = @"M";



    CGFloat nWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat nHeight = [[UIScreen mainScreen] bounds].size.height;

    NSString*  partner_id=[[NSBundle mainBundle] objectForInfoDictionaryKey:@"PartnerId"];

    [adsync openOfferwallWithframe:CGRectMake(0, 20, nWidth, nHeight-20) partner_id:partner_id cust_id:sCustId newWindow:YES];

};

- (void) showAdsyncWallTest:(NSString*) sCustId:(NSString*) title{

    adsync2 *adsync = [adsync2 sharedManager];
    adsync.title = title;
    adsync.titleTextColor = UIColorFromRGB(0xFFFFFF);
    adsync.titleBackgroundColor = UIColorFromRGB(0x999999);
    adsync.parent = self;

    adsync.custAge = 0;
    adsync.custGender = @"M";
    adsync.isDevelopeMode = YES;


    CGFloat nWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat nHeight = [[UIScreen mainScreen] bounds].size.height;

    [adsync openOfferwallWithframe:CGRectMake(0, 20, nWidth, nHeight-20) partner_id:@"00018-20140409-813" cust_id:sCustId newWindow:YES];

};

@end