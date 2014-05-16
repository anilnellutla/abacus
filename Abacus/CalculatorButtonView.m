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

- (UIColor*)operandBackgroundColor
{
    return [UIColor colorWithRed:0.81 green:0.81 blue:0.81 alpha:1.0];
}

- (UIColor*)operandTouchUpInsideBackgroundColor
{
    return [UIColor colorWithRed:0.61 green:0.81 blue:0.81 alpha:1.0];
}

- (UIColor*)operandTouchDownBackgroundColor
{
    return [UIColor colorWithRed:0.71 green:0.81 blue:0.81 alpha:1.0];
}

- (UIColor*)operatorBackgroundColor
{
    return [UIColor colorWithRed:1.0 green:0.51 blue:0.0 alpha:1.0];
}

- (UIColor*)borderColor
{
    return [UIColor blackColor];
}

- (UIColor*)buttonTitleColor
{
    return [UIColor blackColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    NSAttributedString *buttonTitle = [self buttonTitle];
    NSString* buttonTitleStr = [buttonTitle string];
    if([buttonTitleStr isEqualToString:@"+"] || [buttonTitleStr isEqualToString:@"-"] || [buttonTitleStr isEqualToString:@"="]
       || [buttonTitleStr isEqualToString:@"<--"] || [buttonTitleStr isEqualToString:@"C"] || [buttonTitleStr isEqualToString:@"X"]) {
        [button setBackgroundColor:[self operatorBackgroundColor]];
    } else {
        [button setBackgroundColor:[self operandBackgroundColor]];
    }
    //[button setShowsTouchWhenHighlighted:YES];
    [button setAttributedTitle:buttonTitle forState:UIControlStateNormal];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [self borderColor].CGColor;
    [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (NSAttributedString*)buttonTitle
{
    NSString* buttonTitleStr;
    if([self row] == 1) {
        if([self column] == 1) {
            buttonTitleStr = @"7";
        } else if([self column] ==2) {
            buttonTitleStr = @"8";
        } else if([self column] ==3) {
            buttonTitleStr = @"9";
        } else if([self column] ==4) {
            buttonTitleStr = @"X";
        }
    } else if([self row] == 2) {
        if([self column] == 1) {
            buttonTitleStr = @"4";
        } else if([self column] ==2) {
            buttonTitleStr = @"5";
        } else if([self column] ==3) {
            buttonTitleStr = @"6";
        } else if([self column] ==4) {
            buttonTitleStr = @"-";
        }
    } else if([self row] == 3) {
        if([self column] == 1) {
            buttonTitleStr = @"1";
        } else if([self column] ==2) {
            buttonTitleStr = @"2";
        } else if([self column] ==3) {
            buttonTitleStr = @"3";
        } else if([self column] ==4) {
            buttonTitleStr = @"+";
        }
    } else if([self row] == 4) {
        if([self column] == 1) {
            buttonTitleStr = @"0";
        } else if([self column] ==2) {
            buttonTitleStr = @"<--";
        } else if([self column] ==3) {
            buttonTitleStr = @"C";
        } else if([self column] ==4) {
            buttonTitleStr = @"=";
        }
    }
    
    NSMutableAttributedString *butonTitle = [[NSMutableAttributedString alloc] initWithString:buttonTitleStr];
    [butonTitle setAttributes:@{NSStrokeColorAttributeName : [self buttonTitleColor] }
                   range:NSMakeRange(0, [butonTitle length])];
    return butonTitle;
}

-(void)buttonTouchDown:(UIButton*)button
{    
    [UIView animateWithDuration: 0.2 delay: 0 options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         button.alpha = 0.9;
                     }
                     completion: ^(BOOL finished) {
                         [UIView animateWithDuration: 0.2 delay: 0 options: UIViewAnimationOptionCurveLinear
                                          animations: ^{
                                              button.alpha = 1.0;
                                          }
                                          completion: ^(BOOL finished) {
                                          }
                          ];
                     }
     ];
    
}




@end
