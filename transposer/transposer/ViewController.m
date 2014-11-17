//
//  ViewController.m
//  transposer
//
//  Created by ljsaj on 11/3/14.
//  Copyright (c) 2014 com.gersh. All rights reserved.
//
// note that enums and nsarray in objective c should never be used. They don't play well together.

#import "ViewController.h"

@interface ViewController (){
    NSArray *_pickerNotes;
    NSArray *_triad;
    NSArray *_inChord;
    NSArray *_outChord;
    NSArray *_notesss;
    Triad triadType;
    int transSteps;
    Note _oldChord[3];
}


@end



@implementation ViewController

@synthesize stepsStepper,stepsLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    _pickerData = @[@"A", @"A#", @"B", @"C", @"C#", @"D", @"D#", @"F", @"F#", @"G", @"G#"];
    _pickerNotes = [[NSArray alloc] initWithObjects:
                    [NSNumber numberWithInt:A],
                    [NSNumber numberWithInt:As],
                    [NSNumber numberWithInt:B],
                    [NSNumber numberWithInt:C],
                    [NSNumber numberWithInt:Cs],
                    [NSNumber numberWithInt:D],
                    [NSNumber numberWithInt:Ds],
                    [NSNumber numberWithInt:E],
                    [NSNumber numberWithInt:F],
                    [NSNumber numberWithInt:Fs],
                    [NSNumber numberWithInt:G],
                    [NSNumber numberWithInt:Gs]
                    , nil];
    _triad = [NSArray alloc];

    _notesss = [[NSArray alloc] initWithObjects:A,B,C, nil];
    
    self.notePicker.dataSource = self;
    self.notePicker.delegate = self;

    _inChord = [[NSArray alloc] initWithObjects:
              [NSNumber numberWithInt:A],
              [NSNumber numberWithInt:A],
              [NSNumber numberWithInt:A],
              nil];

    _oldChord[0] = A;
    _oldChord[1] = A;
    _oldChord[2] = B;
}

- (Note)nsnumberToNote:(NSNumber*)num {
    return [num intValue];
}

- (NSString*)triadToNsString:(Triad)triad ofRoot:(Note)note {
    NSString *result = [self noteToString:note];
    switch (triad){
        case MAJ:
            result = [NSString stringWithFormat:@"%@ %@", result, @"major"];
            break;
        case MIN:
            result = [NSString stringWithFormat:@"%@ %@", result, @"minor"];
            break;
        case AUG:
            result = [NSString stringWithFormat:@"%@ %@", result, @"augmented"];
            break;
        case DIM:
            result = [NSString stringWithFormat:@"%@ %@", result, @"diminished"];
            break;
        case SUS2:
            result = [NSString stringWithFormat:@"%@ %@", result, @"suspended 2nd"];
            break;
        case SUS4:
            result = [NSString stringWithFormat:@"%@ %@", result, @"suspended 4th"];
            break;
        case UNK:
            result = [NSString stringWithFormat:@"%@ %@", result, @"who knows? Not Gersh."];
            break;
        default:
            result = [NSString stringWithFormat:@"%@ %@", result, @"who knows? Not Gersh."];
            break;
    }
    return result;
}

- (Note)intToNote:(int)num {
    if(num> [_pickerNotes count]){
        return A;
    }
    return [self nsnumberToNote:_pickerNotes[num]];
}

- (int)noteToInt:(Note)note {
    int res;
    
    switch (note) {
        case A:
            res = 1;
            break;
        case As:
            res = 2;
            break;
        case B:
            res = 3;
            break;
        case C:
            res = 4;
            break;
        case Cs:
            res = 5;
            break;
        case D:
            res = 6;
            break;
        case Ds:
            res = 7;
            break;
        case E:
            res = 8;
            break;
        case F:
            res = 9;
            break;
        case Fs:
            res = 10;
            break;
        case G:
            res = 11;
            break;
        case Gs:
            res = 12;
            break;
        default:
            res = 0;
            break;
    }
    return res;
}

- (NSString*)noteToString:(Note)note {
    NSString *result = nil;
    
    switch (note) {
        case A:
            result = @"A";
            break;
        case As:
            result = @"A#";
            break;
        case B:
            result = @"B";
            break;
        case C:
            result = @"C";
            break;
        case Cs:
            result = @"C#";
            break;
        case D:
            result = @"D";
            break;
        case Ds:
            result = @"D#";
            break;
        case E:
            result = @"E";
            break;
        case F:
            result = @"F";
            break;
        case Fs:
            result = @"F#";
            break;
        case G:
            result = @"G";
            break;
        case Gs:
            result = @"G#";
            break;
        default:
            result = @"UhOh";
            break;
    }
    return result;
}

- (int)getInterval:(int)root toNote:(int)interval
{
    if(root <= interval){
        return interval - root;
    }
    else {
        return interval + 12 - root;
    }
}


    
- (void)updateDisplay
{
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    int firstInterval = [self getInterval:[self noteToInt:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]] toNote:[self noteToInt:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:1]]]]];
//    int secondInterval = [self getInterval:[self noteToInt:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]] toNote:[self noteToInt:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:2]]]]];
    
    int firstInterval = [self getInterval:[self noteToInt:_oldChord[0]] toNote:[self noteToInt:_oldChord[1]]];
    int secondInterval = [self getInterval:[self noteToInt:_oldChord[0]] toNote:[self noteToInt:_oldChord[2]]];
    
    if(firstInterval <= secondInterval){
    }
    else{
        int temp = secondInterval;
        secondInterval = firstInterval;
        firstInterval = temp;
    }

    triadType = UNK;
    if(firstInterval == 4){
        if(secondInterval == 7){
            triadType = MAJ;
        }
        else if(secondInterval == 8){
            triadType = AUG;
        }
    }
    else if(firstInterval == 3){
        if(secondInterval == 7){
            triadType = MIN;
        }
        else if(secondInterval == 6){
            triadType = DIM;
        }
    }
    else if(secondInterval == 7){
        if(firstInterval == 5){
            triadType = SUS4;
        }
        else if(firstInterval == 2){
            triadType = SUS2;
        }
    }
    
    _inputChordLabel.text = [self triadToNsString:triadType
                                           ofRoot:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]];
    _intervalLabel.text = [NSString stringWithFormat:@"Root:%@ %i %i",
                           [self noteToString:[self nsnumberToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]],
                           firstInterval,
                           secondInterval
                           ];
    
    [self updateDisplay];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerNotes.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    return _pickerData[row];
    return [self noteToString:[self nsnumberToNote:[_pickerNotes objectAtIndex:row]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
//    if(_nightSwitch.isOn){
//    [UILabel]label.backgroundColor = [UIColor grayColor];
//    label.textColor = [UIColor whiteColor];
//    } else{
//        label.backgroundColor = [UIColor whiteColor];
//        label.textColor = [UIColor grayColor];
//    }
//    return label;    
//}



- (IBAction)switchChanged:(UISwitch *)sender
{
    BOOL setting = sender.isOn;
    [self.nightSwitch setOn:setting animated:YES];
    if(setting){
        self.view.backgroundColor = [UIColor whiteColor];
        _inputChordLabel.textColor = _intervalLabel.textColor = [UIColor grayColor];
    }
    else{
        self.view.backgroundColor = [UIColor grayColor];
        _inputChordLabel.textColor = _intervalLabel.textColor = [UIColor whiteColor];
    }
}

- (IBAction)stepsAction:(id)sender {
    transSteps = stepsStepper.value;
    if(stepsStepper.value > 0){
        _transUpDnLabel.text = @"Transpose Up";
    }else{
        _transUpDnLabel.text = @"Transpose Dn";
    }
    stepsLabel.text = [NSString stringWithFormat:@"%.f",fabs(transSteps)];
    
    
    
    
    [self updateDisplay];

//    stepsLabel.text = [NSString stringWithFormat:@"%@",[self noteToString:[self intToNote:stepsStepper.value]]];
//    stepsLabel.text = [NSString stringWithFormat:@"%@",;
    
}
@end
