//
//  ColumnView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "ColumnView.h"
#import "BeadView.h"
#import "BeadBehavior.h"

@interface ColumnView() <UIDynamicAnimatorDelegate>
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) BeadBehavior *beadBehavior;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
@end

@implementation ColumnView

static const NSUInteger BEADS_PER_COLUMN = 5;
static const CGFloat BEAD_GAP = 4;

#define COLUMN_BEAD_SIZE_RATIO 0.70

- (BeadBehavior *)beadBehavior
{
    if (!_beadBehavior) {
        _beadBehavior = [[BeadBehavior alloc] init];
        [self.animator addBehavior:_beadBehavior];
    }
    return _beadBehavior;
}

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        _animator.delegate = self;
    }
    return _animator;
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    NSLog(@"dynamicAnimatorDidPause");
}


#pragma mark - Initialization

- (void)setUp
{
    self.backgroundColor = nil;
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
    CGSize BEAD_SIZE = { rect.size.width * COLUMN_BEAD_SIZE_RATIO, rect.size.width * COLUMN_BEAD_SIZE_RATIO};
    CGFloat beadOriginX = rect.origin.x + (rect.size.width - BEAD_SIZE.width)/2;
    CGFloat beadOriginY = 0 + BEAD_GAP;
    
    int beadIndex = 5;
    CGRect beadFrame = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
    BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame];
    beadView.beadIndex = beadIndex;
    [self addSubview:beadView];
    [self.beadBehavior addItem:beadView];

    
    beadOriginY = (rect.size.height) - (BEAD_SIZE.height) - (BEAD_GAP);
    for(NSUInteger i = 0; i < (BEADS_PER_COLUMN - 1); i++) {
        CGRect beadFrame = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
        BeadView *beadView = [[BeadView alloc] initWithFrame:beadFrame];
        beadView.beadIndex = --beadIndex;
        [self addSubview:beadView];
        [self.beadBehavior addItem:beadView];
        
        beadOriginY = beadOriginY - BEAD_SIZE.height - (BEAD_GAP);
    }
}


@end
