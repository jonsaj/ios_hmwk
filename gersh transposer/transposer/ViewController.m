//
//  ViewController.m
//  transposer
//
//  Created by ljsaj on 11/3/14.
//  Copyright (c) 2014 com.gersh. All rights reserved.
//
// note that enums and nsarray in objective c should never be used. They don't play well together.
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface ViewController (){
    Note _notes[12];
    NSString *_notesString[12];
    Triad triadType;
    int transSteps;
    Note _oldChord[3];
    BOOL _fairNotes[12];
    Note root;
    Note _newChord[3];
    NSString *_randomStrings[10];
    
    UIColor *color1, *color2, *color3, *color4, *darkcolor4, *darkcolor3,*darkcolor2,*darkcolor1,*backgroundcol,*darkbackgroundcol;
    
    AVAudioPlayer *_audioPlayer0, *_audioPlayer1, *_audioPlayer2, *_audioPlayer3, *_audioPlayer4, *_audioPlayer5;
}
@end



@implementation ViewController

@synthesize stepsStepper,stepsLabel;

- (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
{
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

- (void)playChord
{
    for(int i = 0; i<3; i++){
        [self playPickerSound:i];
    }
}

- (void)playOutChord
{
    for(int i = 0; i<3; i++){
        [self playPickerSound:(i+3)];
    }
}

- (void)updateOutputSounds
{
    for(int i =0; i<3; i++){
        int noteint = [self noteToInt:_newChord[i]];
        [self setSountPickerNote:(i+3) ofNote:_notesString[noteint]];
        NSLog(@"%@", _notesString[noteint]);
    }
}

- (void)playPickerSound:(int)row
{
    if(row == 0){
        [_audioPlayer0 play];
    }
    if(row == 1){
        [_audioPlayer1 play];
    }
    if(row == 2){
        [_audioPlayer2 play];
    }
    if(row == 3){
        [_audioPlayer3 play];
    }
    if(row == 4){
        [_audioPlayer4 play];
    }
    if(row == 5){
        [_audioPlayer5 play];
    }
    
}



- (void)setSountPickerNote:(int)component ofNote:(NSString*)notestr
{
//    NSLog(@"%d %@", component, notestr);
    if(component == 0){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer0 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    if(component == 1){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    if(component == 2){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    if(component == 3){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    if(component == 4){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer4 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    if(component == 5){
        NSString *path = [NSString stringWithFormat:@"%@/%@.wav", [[NSBundle mainBundle] resourcePath], notestr];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        _audioPlayer5 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    }
    

}

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
    
    _randomStrings[0] = @"who know's what?";
    _randomStrings[1] = @"Gersh doesn't know.";
    _randomStrings[2] = @"doesn't really exist";
    _randomStrings[3] = @"try again";
    _randomStrings[4] = @"minor not really";
    _randomStrings[5] = @"not real";
    _randomStrings[6] = @"isn't a chord";
    _randomStrings[7] = @"that chord's trash";
    _randomStrings[8] = @"sounds terrible";
    _randomStrings[9] = @"trash.";
    
    
    self.notePicker.dataSource = self;
    self.notePicker.delegate = self;

    _oldChord[0] = A;
    _oldChord[1] = A;
    _oldChord[2] = A;
    
    triadType = UNK;
    
    color1 = [self colorwithHexString:@"4B5B6E" alpha:1];
    color2 = [self colorwithHexString:@"6C5F56" alpha:1];
    color3 = [self colorwithHexString:@"6C5F56" alpha:1];
    color4 = [self colorwithHexString:@"6C5F56" alpha:1];
    backgroundcol = [self colorwithHexString:@"CCCCCC" alpha:1];
    
    darkcolor1 = [self colorwithHexString:@"CCCCCC" alpha:1];
    darkcolor2 = [self colorwithHexString:@"F1F2DF" alpha:1];
    darkcolor3 = [self colorwithHexString:@"CCCCCC" alpha:1];
    darkcolor4 = [self colorwithHexString:@"CCCCCC" alpha:1];
    darkbackgroundcol = [self colorwithHexString:@"4B5B6E" alpha:1];
    
//    color1 = [self colorwithHexString:@"4B5B6E" alpha:1];
//    color2 = [self colorwithHexString:@"6C5F56" alpha:1];
//    color3 = [self colorwithHexString:@"6C5F56" alpha:1];
//    color4 = [self colorwithHexString:@"6C5F56" alpha:1];
//    backgroundcol = [self colorwithHexString:@"CCCCCC" alpha:1];
//    
//    darkcolor1 = [self colorwithHexString:@"475B5A" alpha:1];
//    darkcolor2 = [self colorwithHexString:@"A3A9AA" alpha:1];
//    darkcolor3 = [self colorwithHexString:@"52D1DC" alpha:1];
//    darkcolor4 = [self colorwithHexString:@"BBBBBF" alpha:1];
//    darkbackgroundcol = [self colorwithHexString:@"8D8E8E" alpha:1];
    
//    color1 = [self colorwithHexString:@"1C3835" alpha:1];
//    color2 = [self colorwithHexString:@"36082F" alpha:1];
//    color3 = [self colorwithHexString:@"8000FF" alpha:1];
//    color4 = [self colorwithHexString:@"F8411F" alpha:1];
//    backgroundcol = [self colorwithHexString:@"F8EC7E" alpha:1];
//    
//    darkcolor1 = [self colorwithHexString:@"A69317" alpha:1];
//    darkcolor2 = [self colorwithHexString:@"526602" alpha:1];
//    darkcolor3 = [self colorwithHexString:@"36082F" alpha:1];
//    darkcolor4 = [self colorwithHexString:@"1C3835" alpha:1];
//    darkbackgroundcol = [self colorwithHexString:@"000000" alpha:1];

    [self colorDay];
}

- (void)colorDay{
    self.view.backgroundColor = backgroundcol;
    _inputChordLabel.textColor  = color1;
    _resultLabel.textColor  = stepsLabel.textColor = _outputChordName.textColor = _transUpDnLabel.textColor = color2;
    _resultingChord.textColor = stepsStepper.tintColor = _nightSwitch.onTintColor = color3;
    _intervalLabel.textColor = color4;

}

- (void)colorNight{
    self.view.backgroundColor = darkbackgroundcol;
    _inputChordLabel.textColor = darkcolor1;
    _resultLabel.textColor = stepsLabel.textColor = _outputChordName.textColor = _transUpDnLabel.textColor = darkcolor2;
    _resultingChord.textColor = stepsStepper.tintColor = _nightSwitch.onTintColor = darkcolor3;
    _intervalLabel.textColor = darkcolor4;
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
            result = [NSString stringWithFormat:@"%@ %@", result, _randomStrings[rand()%10]];
            break;
        default:
            result = [NSString stringWithFormat:@"%@ %@", result, _randomStrings[rand()%10]];
            break;
    }
    return result;
}
- (IBAction)playButtonPressed:(id)sender {
    [self updateOutputSounds];
    [self playOutChord];
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
    Triad tri = UNK;
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



- (void)renderResultLabel:(int)steps
{
    for(int i=0; i<3; i++){
        _newChord[i] = ([self noteToInt:_oldChord[i]]+steps+12)%12;
    }
//    NSLog(@"%@", [self triadToNsString:triadType ofRoot:_newChord[0]]);
    _resultLabel.text = [NSString stringWithFormat:@"%@", [self triadToNsString:triadType ofRoot:_newChord[0]]];
    if(triadType != UNK){
        _outputChordName.text = [self triadToNsString:triadType ofRoot:_newChord[0]];
        _playChordButton.titleLabel.text = [self triadToNsString:triadType ofRoot:_newChord[0]];
        _resultingChord.text = [NSString stringWithFormat:@"%@ %@ %@", _notesString[_newChord[0]],_notesString[_newChord[1]],_notesString[_newChord[2]]];
    }
    else{
        _resultingChord.text = @"";
        _outputChordName.text = @"";
        _playChordButton.titleLabel.text = @"";

    }
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
    
    [self renderResultLabel:stepsStepper.value];
    [self setSountPickerNote:component ofNote:_notesString[row]];
    [self playPickerSound:component];
    [self playChord];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (sizeof(_notes)/sizeof(_notes[0]));
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UILabel* tView = (UILabel*)view;
//    if (!tView)
//    {
//        
//        tView = [[UILabel alloc] init];
//        tView.textAlignment = NSTextAlignmentCenter;
//        if(_notes[row] == B){
//            tView.textColor = [UIColor redColor];
//        }
//    }
//    // Fill the label text here
//    tView.text=_notesString[row];
//    return tView;
//}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = _notesString[row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    if(_nightSwitch.isOn){
    attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:color1}];
    }
    

    return attString;
    
}

//- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    return _notesString[row];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)switchChanged:(UISwitch *)sender
{
    BOOL setting = sender.isOn;
    [self.nightSwitch setOn:setting animated:YES];
    if(setting){
        [self colorDay];
    }
    else{
        [self colorNight];
    }
    [self.notePicker reloadAllComponents];
}

- (IBAction)stepsAction:(id)sender {
    transSteps = stepsStepper.value;
    if(stepsStepper.value > 0){
        if(stepsStepper.value == 1 ){
            _transUpDnLabel.text = [NSString stringWithFormat:@"Transpose Up %.f half step",fabs(transSteps)];

        }else{
            _transUpDnLabel.text = [NSString stringWithFormat:@"Transpose Up %.f half steps",fabs(transSteps)];
        }
    }else{
        if(stepsStepper.value == -1 ){
        _transUpDnLabel.text = [NSString stringWithFormat:@"Transpose Dn %.f half step",fabs(transSteps)];
        
    }else{
        _transUpDnLabel.text = [NSString stringWithFormat:@"Transpose Dn %.f half steps",fabs(transSteps)];
    }
    }
//    stepsLabel.text = [NSString stringWithFormat:@"%.f",fabs(transSteps)];
    [self renderResultLabel:stepsStepper.value];
    [self updateOutputSounds];
    [self playOutChord];
    

}
@end
