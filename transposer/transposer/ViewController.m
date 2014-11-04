//
//  ViewController.m
//  transposer
//
//  Created by ljsaj on 11/3/14.
//  Copyright (c) 2014 com.gersh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
//    NSArray *_pickerData;
    NSArray *_pickerNotes;
    NSMutableArray *_triad;
}

@end

@implementation ViewController


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
                    [NSNumber numberWithInt:F],
                    [NSNumber numberWithInt:Fs],
                    [NSNumber numberWithInt:G],
                    [NSNumber numberWithInt:Gs]
                    , nil];
    _triad = [NSMutableArray alloc];
    self.notePicker.dataSource = self;
    self.notePicker.delegate = self;
}

- (Note)intToNote:(NSNumber*)num {
    return [num intValue];
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
            result = @"CRAP";
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_triad setObject:[NSNumber numberWithInt:[self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]]] atIndexedSubscript:0];
    int firstInterval = [self getInterval:[self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]] toNote:[self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:1]]]]];
    int secondInterval = [self getInterval:[self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]] toNote:[self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:2]]]]];
    [_triad setObject:[NSNumber numberWithInteger:firstInterval] atIndexedSubscript:1];
    [_triad setObject:[NSNumber numberWithInteger:secondInterval] atIndexedSubscript:2];

    
    NSLog(@"%i", [self getInterval: [self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]]
                            toNote: [self noteToInt:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:1]]]]
                  ]);
    _inputChordLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                             [self noteToString:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:0]]]],
                             [self noteToString:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:1]]]],
                             [self noteToString:[self intToNote:[_pickerNotes objectAtIndex:[pickerView selectedRowInComponent:2]]]],
                             nil];
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
    return [self noteToString:[self intToNote:[_pickerNotes objectAtIndex:row]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
