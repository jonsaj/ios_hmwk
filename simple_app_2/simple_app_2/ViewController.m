//
//  ViewController.m
//  simple_app_2
//
//  Created by ljsaj on 9/30/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchSwitched:(UISwitch *)sender {
    [self flopColor];
}

- (void) flopColor{
    if(_UIbkg.backgroundColor == [UIColor blackColor]){
        _thatLabel.textColor = [UIColor blackColor];
        _UIbkg.backgroundColor = [UIColor whiteColor];
        
    }
    else{
        _UIbkg.backgroundColor = [UIColor blackColor];
        _thatLabel.textColor = [UIColor whiteColor];
        
    }
}
@end
