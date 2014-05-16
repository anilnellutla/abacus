//
//  CalculatorView.m
//  Abacus
//
//  Created by Anil K Nellutla on 5/11/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "CalculatorView.h"
#import "UIConfig.h"
#import "UIConstants.h"
#import "CalculatorButtonView.h"
#import "CalculatorDisplayView.h"

@implementation CalculatorView

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

- (UIColor *)calculatorBorderColor
{
    return [UIColor blackColor];
}

- (UIColor *)calculatorBackgroundColor
{
    return [UIColor blackColor];
}


- (UIColor *)displayBackgroundColor
{
    return [UIColor blackColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [[self calculatorBackgroundColor] setFill];
    [path fill];

    [[self calculatorBorderColor] setStroke];
    [path stroke];
    
    [self drawDisplay:rect];
    [self drawButtons:rect];
}

- (void)drawDisplay:(CGRect)calculatorViewBounds
{
    CalculatorDisplayView *calculatorDisplayView = [[CalculatorDisplayView alloc] initWithFrame:calculatorViewBounds];
    [self addSubview:calculatorDisplayView];
}

- (void)drawButtons:(CGRect)calculatorViewBounds
{
    for(NSInteger row = 1; row <= CALCULATOR_DIGIT_BUTTONS_ROWS; row++) {
        for(NSInteger column = 1; column <= CALCULATOR_DIGIT_BUTTONS_COLUMNS; column++) {
            CGRect buttonBounds = [UIConfig getCalculatorDigitButtonBounds:calculatorViewBounds forRow:
                                   row forColumn:column];
            
            CalculatorButtonView *calculatorButtonView = [[CalculatorButtonView alloc] initWithFrame:buttonBounds
                                                                                              forRow:row
                                                                                           forColumn:column];
            [self addSubview:calculatorButtonView];
    
        }
    }
}

@end
