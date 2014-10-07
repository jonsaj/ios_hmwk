//
//  CarMakeAndModel.m
//  SECONDTRY
//
//  Created by ljsaj on 10/6/14.
//  Copyright (c) 2014 ljsaj. All rights reserved.
//

#import "CarMakeAndModel.h"

@interface CarMakeAndModel ()
@property (strong, nonatomic) UILabel *makeLabel;
@property (strong, nonatomic) UILabel *modelLabel;
@property (strong, nonatomic) UILabel *yearLabel;
@end

@implementation CarMakeAndModel

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//        
//        CGRect makeLabelRect = CGRectMake(0, 5, 70, 15);
//        UILabel *makeMarker = [[UILabel alloc] initWithFrame:makeLabelRect];
//        makeMarker.textAlignment = NSTextAlignmentRight;
//        makeMarker.text = @"Make:";
//        makeMarker.font = [UIFont boldSystemFontOfSize:12];
//        [self.contentView addSubview:makeMarker];
//        
//        CGRect modelLabelRect = CGRectMake(0, 26, 70, 15);
//        UILabel *modelMarker = [[UILabel alloc] initWithFrame:modelLabelRect];
//        modelMarker.textAlignment = NSTextAlignmentRight;
//        modelMarker.text = @"Model:";
//        modelMarker.font = [UIFont boldSystemFontOfSize:12];
//        [self.contentView addSubview:modelMarker];
//        
//        CGRect makeValueRect = CGRectMake(80, 5, 200, 15);
//        _makeLabel = [[UILabel alloc] initWithFrame:
//                      makeValueRect];
//        [self.contentView addSubview:_makeLabel];
//        
//        CGRect modelValueRect = CGRectMake(80, 26, 200, 15);
//        _modelLabel = [[UILabel alloc] initWithFrame:
//                       modelValueRect];
//        [self.contentView addSubview:_modelLabel];
//        
//        CGRect yearLabelRect = CGRectMake(0, 47, 70, 15);
//        UILabel *yearMarker = [[UILabel alloc] initWithFrame:yearLabelRect];
//        yearMarker.textAlignment = NSTextAlignmentRight;
//        yearMarker.text = @"Year:";
//        yearMarker.font = [UIFont boldSystemFontOfSize:12];
//        [self.contentView addSubview:yearMarker];
//        
//        CGRect yearValueRect = CGRectMake(80, 47, 200, 15);
//        _yearLabel = [[UILabel alloc] initWithFrame:
//                      yearValueRect];
//        [self.contentView addSubview:_yearLabel];
//    }
//    return self;
//}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setYear:(NSString *)year
{
    if (![year isEqualToString:_year]) {
        _year = [year copy];
        self.yearLabel.text = _year;
    } }

- (void)setMake:(NSString *)make
{
    if (![make isEqualToString:_make]) {
        _make = [make copy];
        self.makeLabel.text = _make;
    } }
- (void)setModel:(NSString *)model
{
    if (![model isEqualToString:_model]) {
        _model = [model copy];
        self.modelLabel.text = _model;
    } }

@end
