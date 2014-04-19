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


@implementation ColumnView

static const NSInteger BEADS_PER_COLUMN = 5;
static const CGFloat BEAD_GAP = 2;

//#define COLUMN_BEAD_SIZE_RATIO 0.70
#define COLUMN_BEAD_WIDTH_RATIO 0.62
#define COLUMN_BEAD_HEIGHT_RATIO 0.52

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
    CGSize BEAD_SIZE = { rect.size.width * COLUMN_BEAD_WIDTH_RATIO, rect.size.width * COLUMN_BEAD_HEIGHT_RATIO};
    CGFloat beadOriginX = rect.origin.x + (rect.size.width - BEAD_SIZE.width)/2;
    CGFloat beadOriginY = 0 + BEAD_GAP;
    
    int beadIndex = 5;
    CGRect beadFrame = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
    BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame placeValue:_placeValue beadIndex:beadIndex];
    [self addSubview:beadView];
    
    beadIndex -= 1;
   
    beadOriginY = (rect.size.height) - (BEAD_SIZE.height) - (BEAD_GAP);
    for(NSInteger i = 0; i < (BEADS_PER_COLUMN - 1); i++) {
        CGRect beadFrame = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
        BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame placeValue:_placeValue beadIndex:beadIndex];
        [self addSubview:beadView];
                
        beadOriginY = beadOriginY - BEAD_SIZE.height - (BEAD_GAP);
        beadIndex -= 1;

    }
}


@end
