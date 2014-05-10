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
    //digitLabel.text = [NSString stringWithFormat:@"%ld", [self digit]/[self placeValue]];
    
    NSString *digitLabelText;
    if([self digit] == 0) {
        digitLabelText= [NSString stringWithFormat:@"%ld", [self digit]];
    } else {
        if([self placeValue] == 1 || [self placeValue] == 10 || [self placeValue] == 100 || [self placeValue] == 1000) {
            digitLabelText= [NSString stringWithFormat:@"%ld", [self digit]];
        } else if([self placeValue] == 10000) {
            digitLabelText= [NSString stringWithFormat:@"%ld,000", [self digit]/1000];
        } else if([self placeValue] == 100000) {
            digitLabelText= [NSString stringWithFormat:@"%ld,000", [self digit]/1000];
        } else if([self placeValue] == 1000000) {
            digitLabelText= [NSString stringWithFormat:@"%ld mil", [self digit]/1000000];
        } else if([self placeValue] == 10000000) {
            digitLabelText= [NSString stringWithFormat:@"%ld mil", [self digit]/1000000];
        } else if([self placeValue] == 100000000) {
            digitLabelText= [NSString stringWithFormat:@"%ld mil", [self digit]/1000000];
        } else if([self placeValue] == 1000000000) {
            digitLabelText= [NSString stringWithFormat:@"%ld bil", [self digit]/1000000000];
        }
    }
    digitLabel.text = digitLabelText;
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
}


@end
