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

@end
