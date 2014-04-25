//
//  DigitView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "DigitView.h"
#import "UIConfig.h"

@implementation DigitView

#pragma mark - Initialization

- (void)setUp
{
    //self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (id)initWithFrame:(CGRect)frame placeValue:(NSInteger)placeValue
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        _placeValue = placeValue;
    }
    return self;
}

-(void)setDigit:(NSInteger)digit
{
    _digit = digit;
    [self setDigitLabel];
}

-(void)setDigitLabel
{
    UILabel *digitLabel = [[super subviews] firstObject];
    digitLabel.text = [NSString stringWithFormat:@"%ld", [self digit]/[self placeValue]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UILabel *digitLabel = [[UILabel alloc] initWithFrame:[UIConfig getDigitLabelBounds:rect]];
    digitLabel.text = [NSString stringWithFormat:@"%ld", [self digit]/[self placeValue]];
    digitLabel.textAlignment = NSTextAlignmentCenter;
    digitLabel.textColor = [UIColor blackColor];
    digitLabel.adjustsFontSizeToFitWidth =  YES;
    [self addSubview:digitLabel];
   
    /*
    NSString *placeValueLabelText;
    if([self placeValue] == 1) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 10) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 100) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 1000) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 10000) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 100000) {
        placeValueLabelText= @"";
    } else if([self placeValue] == 1000000) {
        placeValueLabelText= @"(mil)";
    } else if([self placeValue] == 10000000) {
        placeValueLabelText= @"(10 mil)";
    } else if([self placeValue] == 100000000) {
        placeValueLabelText= @"(100 mil)";
    } else if([self placeValue] == 1000000000) {
        placeValueLabelText= @"(bil)";
    }
    UILabel *placeValueLabel = [[UILabel alloc] initWithFrame:[UIConfig getPlaceValueLabelBounds:rect]];
    placeValueLabel.text = placeValueLabelText;
    placeValueLabel.textAlignment = NSTextAlignmentCenter;
    placeValueLabel.textColor = [UIColor blackColor];
    placeValueLabel.adjustsFontSizeToFitWidth =  YES;
    [self addSubview:placeValueLabel];
    */

}


@end
