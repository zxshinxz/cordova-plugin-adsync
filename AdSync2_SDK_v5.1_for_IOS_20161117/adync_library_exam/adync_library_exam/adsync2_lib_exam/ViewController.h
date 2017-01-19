//
//  ViewController.h
//  adsync2_lib_exam
//
//  Created by Sanghong Han on 2016. 10. 8..
//  Copyright © 2016년 mightymedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl *gender;
@property (nonatomic, weak) IBOutlet UISegmentedControl *devmode;
@property (nonatomic, weak) IBOutlet UITextField *txtCustId;
@property (nonatomic, weak) IBOutlet UITextField *txtAge;

- (IBAction)btnNewWindow:(id)sender;
- (IBAction)btnEmbedded:(id)sender;
- (IBAction)btnPoint:(id)sender;
- (IBAction)btnWithDraw:(id)sender;

@end

