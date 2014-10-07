//
//  PickerViewController.h
//  pickers
//
//  Created by ljsaj on 10/7/14.
//  Copyright (c) 2014 ljsaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *planetNames;
@property (strong, nonatomic) NSArray *gravityMods;
@end
