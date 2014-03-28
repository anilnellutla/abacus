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


@implementation ColumnView

static const NSUInteger BEADS_PER_COLUMN = 5;
static const CGFloat BEAD_GAP = 4;

//#define COLUMN_BEAD_SIZE_RATIO 0.70
#define COLUMN_BEAD_WIDTH_RATIO 0.70
#define COLUMN_BEAD_HEIGHT_RATIO 0.55

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

- (void)setColumn:(Column *)column
{
    _column = column;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
    // Drawing code
    [self drawColumn:rect];
}

- (void)drawColumn:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(rect.origin.x + (rect.size.width/2), rect.origin.y)];
    [path addLineToPoint:CGPointMake(rect.origin.x + (rect.size.width/2), rect.size.height)];
    [path closePath];
    [[UIColor blueColor] setStroke];
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
    BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame];
    Bead *bead = [[Bead alloc] initWithValue:0 index:beadIndex];
    beadView.bead = bead;
    [self addSubview:beadView];

    [self.column addBead:bead];
    
    beadIndex -= 1;


    
    beadOriginY = (rect.size.height) - (BEAD_SIZE.height) - (BEAD_GAP);
    for(NSUInteger i = 0; i < (BEADS_PER_COLUMN - 1); i++) {
        CGRect beadFrame = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
        BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame];
        Bead *bead = [[Bead alloc] initWithValue:0 index:beadIndex];
        beadView.bead = bead;
        [self addSubview:beadView];
        
        [self.column addBead:bead];
        
        beadOriginY = beadOriginY - BEAD_SIZE.height - (BEAD_GAP);
        beadIndex -= 1;

    }
}


@end
