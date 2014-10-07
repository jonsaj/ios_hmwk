//
//  NameAndColorCell.m
//  presentation_pract
//
//  Created by ljsaj on 10/6/14.
//  Copyright (c) 2014 ljsaj. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *colorLabel;
@property (strong, nonatomic) UILabel *thirdLabel;
@property (strong, nonatomic) UIImage *pictureLabel;
//can add another property, such as an image.

@end

@implementation NameAndColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMarker = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameMarker.textAlignment = NSTextAlignmentRight;
        nameMarker.text = @"Name:";
        nameMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameMarker];
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colorMarker = [[UILabel alloc] initWithFrame:colorLabelRect];
        colorMarker.textAlignment = NSTextAlignmentRight;
        colorMarker.text = @"Color:";
        colorMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:colorMarker];
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        _nameLabel = [[UILabel alloc] initWithFrame:
                      nameValueRect];
        [self.contentView addSubview:_nameLabel];
        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
        _colorLabel = [[UILabel alloc] initWithFrame:
                       colorValueRect];
        [self.contentView addSubview:_colorLabel];
        
        CGRect thirdLabelRect = CGRectMake(160, 50, 70, 15);
        UILabel *thirdMarker = [[UILabel alloc] initWithFrame:thirdLabelRect];
        thirdMarker.textAlignment = NSTextAlignmentRight;
        thirdMarker.text = @"Third:";
        thirdMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:thirdMarker];
        
        
        CGRect thirdValueRect = CGRectMake(160, 50, 200, 15);
        _thirdLabel = [[UILabel alloc] initWithFrame:
                       thirdValueRect];
        [self.contentView addSubview:_thirdLabel];

        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)n
{
    if (![n isEqualToString:_name]) {
        _name = [n copy];
        self.nameLabel.text = _name;
    } }
- (void)setColor:(NSString *)c
{
    if (![c isEqualToString:_color]) {
        _color = [c copy];
        self.colorLabel.text = _color;
    } }

- (void)setThird:(NSString *)t
{
    if (![t isEqualToString:_third]) {
        _third = [t copy];
        self.thirdLabel.text = _third;
    } }
- (void)setImage:(UIImage *)t
{
    if (![t == ]) {
        _third = [t copy];
        self.thirdLabel.text = _third;
    } }


@end
