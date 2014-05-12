//
//  CalculatorButtonView.m
//  Abacus
//
//  Created by Anil K Nellutla on 5/12/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "CalculatorButtonView.h"

@interface CalculatorButtonView()
@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger column;
@end

@implementation CalculatorButtonView

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

- (id)initWithFrame:(CGRect)frame forRow:(NSInteger)row forColumn:(NSInteger)column
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        _row = row;
        _column = column;
    }
    return self;
}

- (UIColor *)borderColor
{
    return [UIColor blackColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [[self borderColor] setStroke];
    [path stroke];
    
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setTitle:[self buttonText] forState:UIControlStateNormal];
    [self addSubview:button];
}

- (NSString*)buttonText
{
    NSString* buttonText;
    if([self row] == 1) {
        if([self column] == 1) {
            buttonText = @"7";
        } else if([self column] ==2) {
            buttonText = @"8";
        } else if([self column] ==3) {
            buttonText = @"9";
        } else if([self column] ==4) {
            buttonText = @"X";
        }
    } else if([self row] == 2) {
        if([self column] == 1) {
            buttonText = @"4";
        } else if([self column] ==2) {
            buttonText = @"5";
        } else if([self column] ==3) {
            buttonText = @"6";
        } else if([self column] ==4) {
            buttonText = @"-";
        }
    } else if([self row] == 3) {
        if([self column] == 1) {
            buttonText = @"1";
        } else if([self column] ==2) {
            buttonText = @"2";
        } else if([self column] ==3) {
            buttonText = @"3";
        } else if([self column] ==4) {
            buttonText = @"+";
        }
    } else if([self row] == 4) {
        if([self column] == 1) {
            buttonText = @"0";
        } else if([self column] ==2) {
            buttonText = @"<--";
        } else if([self column] ==3) {
            buttonText = @"C";
        } else if([self column] ==4) {
            buttonText = @"=";
        }
    }
    
    return buttonText;
}


@end
