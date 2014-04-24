//
//  DigitView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "DigitView.h"

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
    UILabel *digitLabel = [[super subviews] firstObject];
    digitLabel.text = [NSString stringWithFormat:@"%ld", [self digit]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UILabel *digitLabel = [[UILabel alloc] initWithFrame:rect];
    digitLabel.text = [NSString stringWithFormat:@"%ld", [self digit]];
    digitLabel.textAlignment = NSTextAlignmentCenter;
    digitLabel.textColor = [UIColor blackColor];
    digitLabel.adjustsFontSizeToFitWidth =  YES;
    [self addSubview:digitLabel];
}


@end
