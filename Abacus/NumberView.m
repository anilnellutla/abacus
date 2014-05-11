//
//  NumberView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "NumberView.h"
#import "DigitView.h"
#import "UIConfig.h"
#import "UIConstants.h"
#import "AbacusConstants.h"

@implementation NumberView

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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawDigits:rect];
}

-(void)drawDigits:(CGRect)rect
{
    NSInteger placeValue = 1;
    for(int i = 1; i <= NUM_OF_COLUMNS; i++) {
        CGRect digitViewBounds = [UIConfig getDigitViewBounds:rect forDigit:i];
        DigitView *digitView = [[DigitView alloc] initWithFrame:digitViewBounds placeValue:placeValue];
        [self addSubview:digitView];
        
        placeValue *= 10;
    }
    
}


@end
