//
//  ViewController.h
//  transposer
//
//  Created by ljsaj on 11/3/14.
//  Copyright (c) 2014 com.gersh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *inputChordLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *notePicker;
@property (weak, nonatomic) IBOutlet UILabel *intervalLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepsStepper;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *nightSwitch;
@property (weak, nonatomic) IBOutlet UILabel *transUpDnLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)stepsAction:(id)sender;
typedef NS_ENUM(NSInteger, Note){
A,
As,
B,
C,
Cs,
D,
Ds,
E,
F,
Fs,
G,
Gs
};
typedef NS_ENUM(NSInteger, Triad){
    MAJ,
    MIN,
    AUG,
    DIM,
    SUS2,
    SUS4,
    UNK
};
- (IBAction)switchChanged:(UISwitch *)sender;

//- (IBAction)switchChanged:(UISwitch *)setpsStepper;

@end
