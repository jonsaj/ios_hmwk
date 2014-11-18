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
    Note _notes[12];
    NSString *_notesString[12];
    Triad triadType;
    int transSteps;
    Note _oldChord[3];
    Note root;
}


@end



@implementation ViewController

@synthesize stepsStepper,stepsLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _notes[0] = A;
    _notes[1] = As;
    _notes[2] = B;
    _notes[3] = C;
    _notes[4] = Cs;
    _notes[5] = D;
    _notes[6] = Ds;
    _notes[7] = E;
    _notes[8] = F;
    _notes[9] = Fs;
    _notes[10] = G;
    _notes[11] = Gs;
    
    _notesString[0] = @"A";
    _notesString[1] = @"A#";
    _notesString[2] = @"B";
    _notesString[3] = @"C";
    _notesString[4] = @"C#";
    _notesString[5] = @"D";
    _notesString[6] = @"D#";
    _notesString[7] = @"E";
    _notesString[8] = @"F";
    _notesString[9] = @"F#";
    _notesString[10] = @"G";
    _notesString[11] = @"G#";
    

    self.notePicker.dataSource = self;
    self.notePicker.delegate = self;

    _oldChord[0] = A;
    _oldChord[1] = A;
    _oldChord[2] = A;
}

- (NSString*)triadToNsString:(Triad)triad ofRoot:(Note)note
{
    NSString *result = _notesString[[self noteToInt:note]];
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

- (int)noteToInt:(Note)note
{
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
    return res-1;
}

- (int)getInterval:(int)rt toNote:(int)interval
{

    if(rt <= interval){
        return interval - rt;
    }
    else {
        return interval + 12 - rt;
    }
}

- (Triad)getTriadType:(int)first toSecond:(int)second
{
    Triad tri;
    if(first == 4){
        if(second == 7){
            tri = MAJ;
        }
        else if(second == 8){
            tri = AUG;
        }
    }
    else if(first == 3){
        if(second == 7){
            tri = MIN;
        }
        else if(second == 6){
            tri = DIM;
        }
    }
    else if(second == 7){
        if(first == 5){
            tri = SUS4;
        }
        else if(first == 2){
            tri = SUS2;
        }
    }
    return tri;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _oldChord[component] = _notes[row];
    root = _notes[[pickerView selectedRowInComponent:0]];
    int firstInterval = [self getInterval:[self noteToInt:_oldChord[0]] toNote:[self noteToInt:_oldChord[1]]];
    int secondInterval = [self getInterval:[self noteToInt:_oldChord[0]] toNote:[self noteToInt:_oldChord[2]]];
    if(firstInterval <= secondInterval){
    }
    else{
        int temp = secondInterval;
        secondInterval = firstInterval;
        firstInterval = temp;
    }

    triadType = [self getTriadType:firstInterval toSecond:secondInterval];
    
    _inputChordLabel.text = [self triadToNsString:triadType ofRoot:root];
    _intervalLabel.text = [NSString stringWithFormat:@"Root:%@ %i %i", _notesString[[pickerView selectedRowInComponent:0]], firstInterval, secondInterval ];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (sizeof(_notes)/sizeof(_notes[0]));
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _notesString[row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

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
}
@end
