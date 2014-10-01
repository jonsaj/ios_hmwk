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

- (IBAction)buttonNumPress:(UIButton *)sender {
    _screenOut.text
}

- (IBAction)buttonPlusPress:(UIButton *)sender {
}

- (IBAction)switchSwitched:(UISwitch *)sender {
    [self flopColor];
}

- (void) flopColor{
    if(_UIbkg.backgroundColor == [UIColor blackColor]){
        _thatLabel.textColor = [UIColor blackColor];
        _UIbkg.backgroundColor = [UIColor whiteColor];
        _screenOut.textColor = [UIColor blackColor];
        _thatLabel.text = @"Normal View";
    }
    else{
        _UIbkg.backgroundColor = [UIColor blackColor];
        _thatLabel.textColor = [UIColor whiteColor];
        _thatLabel.text = @"Night View";
        _screenOut.textColor = [UIColor whiteColor];

    }
}
@end
