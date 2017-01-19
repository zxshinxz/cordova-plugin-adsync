//
//  ViewController.m
//  adsync2_lib_exam
//
//  Created by Sanghong Han on 2016. 10. 8..
//  Copyright © 2016년 mightymedia. All rights reserved.
//

#import "ViewController.h"
#import "adsync2.h"

#undef UIColorFromRGB
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

// AdSync2 광고가 종료되면 호출된다. 
- (void)closeAdSyncHandleView {
    NSLog(@"**** closeAdSyncHandleView ***");
}

#pragma mark - IBAction Function

- (IBAction)btnNewWindow:(id)sender
{
    adsync2 *adsync = [adsync2 sharedManager];
    adsync.title = @"포인트 충전";
    adsync.titleTextColor = UIColorFromRGB(0xFFFFFF);
    adsync.titleBackgroundColor = UIColorFromRGB(0x999999);
    adsync.parent = self;

    adsync.custAge = [self.txtAge.text isEqualToString:@""] ? 0 : [self.txtAge.text integerValue];
    adsync.custGender = (self.gender.selectedSegmentIndex == 0) ? @"M" : ((self.gender.selectedSegmentIndex == 1) ? @"F" : @"A");
    adsync.isDevelopeMode = (self.devmode.selectedSegmentIndex == 0) ? YES : NO;

    NSString *sCustId  = ([self.txtCustId.text isEqualToString:@""] ? @"1" : self.txtCustId.text);
    
    CGFloat nWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat nHeight = [[UIScreen mainScreen] bounds].size.height;
    
    [adsync openOfferwallWithframe:CGRectMake(0, 20, nWidth, nHeight-20) partner_id:@"00018-20140409-813" cust_id:sCustId newWindow:YES];
}

- (IBAction)btnEmbedded:(id)sender
{
    adsync2 *adsync = [adsync2 sharedManager];
    adsync.isDevelopeMode = YES;
    adsync.parent = self.view;
    
    adsync.custAge = [self.txtAge.text isEqualToString:@""] ? 0 : [self.txtAge.text integerValue];
    adsync.custGender = (self.gender.selectedSegmentIndex == 0) ? @"M" : ((self.gender.selectedSegmentIndex == 1) ? @"F" : @"A");
    adsync.isDevelopeMode = (self.devmode.selectedSegmentIndex == 0) ? YES : NO;
    
    NSString *sCustId  = ([self.txtCustId.text isEqualToString:@""] ? @"1" : self.txtCustId.text);
    
    CGFloat nWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat nHeight = [[UIScreen mainScreen] bounds].size.height;
    
    [adsync openOfferwallWithframe:CGRectMake(0, 260, nWidth, nHeight-260) partner_id:@"00018-20140409-813" cust_id:sCustId newWindow:NO];
}

- (IBAction)btnPoint:(id)sender
{
    adsync2 *adsync = [adsync2 sharedManager];
    [adsync requestPoint:@"00018-20130326-280"
                     uid:10139291
                  cus_id:@"777"
                 success:^(BOOL result, int point) {
                     NSLog(@"point is %d", (int)point);
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Return of Point API"
                                                                                    message:[NSString stringWithFormat:@"Point is %d", point] preferredStyle:UIAlertControllerStyleAlert];
                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction *action) {
                                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                                      }];
                     [alert addAction:okAction];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                 }
                 failure:^(NSString *errorMessage) {
                     NSLog(@"errorMessage is %@", errorMessage);
                     
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                    message:errorMessage
                                                                             preferredStyle:UIAlertControllerStyleAlert];
                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction *action) {
                                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                                      }];
                     [alert addAction:okAction];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                 }
     ];
}

- (IBAction)btnWithDraw:(id)sender
{
    adsync2 *adsync = [adsync2 sharedManager];
    [adsync withDrawPoint:@"00018-20130326-280"
                      uid:10139291
                   cus_id:@"777"
              description:@""
                 success:^(BOOL result, int point) {
                     NSLog(@"point is %d", (int)point);
                     
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Return of Withdraw Point API"
                                                                                    message:[NSString stringWithFormat:@"Point is %d", point] preferredStyle:UIAlertControllerStyleAlert];
                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction *action) {
                                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                                      }];
                     [alert addAction:okAction];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                 }
                 failure:^(NSString *errorMessage) {
                     NSLog(@"errorMessage is %@", errorMessage);
                     
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                    message:errorMessage
                                                                             preferredStyle:UIAlertControllerStyleAlert];
                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction *action) {
                                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                                      }];
                     [alert addAction:okAction];
                     
                     [self presentViewController:alert animated:YES completion:nil];
                 }
     ];
}

#pragma mark - init

- (void)viewSDKVersion
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[adsync2 getSDKLibraryName]
                                                                   message:[adsync2 getSDKVersion]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                     }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [self performSelector:@selector(viewSDKVersion) withObject:nil afterDelay:0.2f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    
    if (([touch view] != self.txtCustId) || ([touch view] != self.txtAge)) {
        [self.txtCustId resignFirstResponder];
        [self.txtAge resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}

@end
