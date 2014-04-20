//
//  ColumnView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "ColumnView.h"
#import "BeadView.h"
#import "Bead.h"
#import "UIConfig.h"
#import "UIConstants.h"


@implementation ColumnView

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

- (id)initWithFrame:(CGRect)frame placeValue:(NSInteger)placeValue
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        _placeValue = placeValue;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
    // Drawing code
    [self drawColumn:rect];
}

- (UIColor *)columnColor
{
    return [UIColor blackColor];
}

- (void)drawColumn:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIConfig getColumnBounds:rect]];
    [[self columnColor] setFill];
    [path fill];
    [[self columnColor] setStroke];
    [path stroke];
    
    [self drawBeads:rect];

}

- (void)drawBeads:(CGRect)rect
{
    for(NSInteger i = BEADS_PER_COLUMN; i >= 1; i--) {
        CGRect beadViewBounds = [UIConfig getBeadViewBounds:rect forBead:i];
        BeadView *beadView = [[BeadView alloc] initWithFrame:beadViewBounds placeValue:_placeValue beadIndex:i];
        [self addSubview:beadView];
    }
}


@end
