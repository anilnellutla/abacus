//
//  AbacusView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/18/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AbacusView.h"
#import "ColumnView.h"
#import "RowView.h"
#import "Column.h"
#import "UIConfig.h"
#import "UIConstants.h"

@implementation AbacusView

- (UIColor *)abacusBorderColor
{
    return [UIColor blackColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundRect addClip];
    
    [self drawAbacus:rect];
    
}

-(void)drawAbacus:(CGRect)rect
{    
    UIBezierPath *abacusRect = [UIBezierPath bezierPathWithRect:rect];
    
    [[self abacusBorderColor] setStroke];
    [abacusRect stroke];
        
    [self drawRow:rect];

    [self drawColumns:rect];
    
}

-(void)drawColumns:(CGRect)rect
{
    int placeValue = 1;
    for(int i = 1; i <= NUM_OF_COLUMNS; i++) {
        CGRect columnViewBounds = [UIConfig getColumnViewBounds:rect forColumn:i];
        ColumnView *columnView = [[ColumnView alloc] initWithFrame:columnViewBounds placeValue:placeValue];
        [self addSubview:columnView];
                
        placeValue *= 10;
    }
}

-(void)drawRow:(CGRect)rect
{
    CGRect rowViewBounds = [UIConfig getRowViewBounds:rect];
    RowView *rowView = [[RowView alloc] initWithFrame:rowViewBounds];
    [self addSubview:rowView];
}

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

@end
