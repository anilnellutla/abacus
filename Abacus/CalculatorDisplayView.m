//
//  CalculatorDisplayView.m
//  Abacus
//
//  Created by Anil K Nellutla on 5/16/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "CalculatorDisplayView.h"
#import "UIConfig.h"

@implementation CalculatorDisplayView

#pragma mark - Initialization

- (void)setUp
{
    //self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (UIColor *)backgroundColor
{
    return [UIColor blackColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect displayBounds = [UIConfig getCalculatorDigitDisplayBounds:rect];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:displayBounds];
    [[self backgroundColor] setFill];
    [path fill];
    
    [[self backgroundColor] setStroke];
    [path stroke];
}


@end
