//
//  AbacusValueView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AbacusValueView.h"
#import "UIConfig.h"

@implementation AbacusValueView

- (void)setUp
{
    //self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setValue:(NSInteger)value
{
    _value = value;
    [self setAbacusValueLabel];
}

-(void)setAbacusValueLabel
{
    UILabel *abacusValueLabel = [[super subviews] firstObject];
    abacusValueLabel.text = [NSString stringWithFormat:@"%ld", [self value]];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UILabel *abacusValueLabel = [[UILabel alloc] initWithFrame:rect];
    abacusValueLabel.text = [NSString stringWithFormat:@"%ld", [self value]];
    abacusValueLabel.textAlignment = NSTextAlignmentCenter;
    abacusValueLabel.textColor = [UIColor blackColor];
    abacusValueLabel.adjustsFontSizeToFitWidth =  YES;
    [self addSubview:abacusValueLabel];
}


@end
