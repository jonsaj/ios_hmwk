//
//  ViewController.h
//  simple_app_2
//
//  Created by ljsaj on 9/30/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *thatLabel;
@property (weak, nonatomic) IBOutlet UIView *UIbkg;
- (IBAction)switchSwitched:(UISwitch *)sender;
- (void)flopColor;

@end
