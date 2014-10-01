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
    _screenText = [[NSMutableString alloc] init];
    _storeNum = 0;
    _buffNum = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonNumPress:(UIButton *)sender {
    [_buffNum appendString: [sender titleForState:UIControlStateNormal]];
    [_screenText appendString: [sender titleForState:UIControlStateNormal]];
    _screenOut.text = _screenText;
}

- (IBAction)buttonPlusPress:(UIButton *)sender {
    
    _storeNum = _storeNum + [_buffNum intValue];
    _screenText = [NSMutableString stringWithFormat:@"%d",_storeNum];
    [_screenText appendString:@"+"];
    _buffNum =[[NSMutableString alloc] init];
    _screenOut.text = _screenText;

}

- (IBAction)switchSwitched:(UISwitch *)sender {
    [self flopColor];
}

- (IBAction)buttonClearPress:(UIButton *)sender {
    _screenText = [[NSMutableString alloc] init];
    _storeNum = 0;
    _buffNum = 0;
    _screenOut.text = _screenText;

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
