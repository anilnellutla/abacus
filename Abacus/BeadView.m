//
//  BeadView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "BeadView.h"
#import "BeadBehavior.h"

@interface BeadView() <UIDynamicAnimatorDelegate>
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) BeadBehavior *beadBehavior;
@end

@implementation BeadView

static const CGFloat BEAD_GAP = 2;

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
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.superview];
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

- (void)setBead:(Bead *)bead
{
    _bead = bead;
}

- (UIColor *)beadColor
{
    return [UIColor colorWithRed:0.45 green:0.2 blue:0.02 alpha:1.0];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 0;
    [[self beadColor] setFill];
    [path fill];
    [[self beadColor] setStroke];
    [path stroke];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drag:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self addGestureRecognizer:panRecognizer];
}

- (void)drag:(UIPanGestureRecognizer *)recognizer
{
    
    //NSLog(@"move");
    CGPoint translation = [recognizer translationInView:self];
    CGPoint velocity = [recognizer velocityInView:self];
    BOOL dragDown = NO;
    if(velocity.y > 0) {
        dragDown = YES;
    }
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    if(dragDown == YES) {
        if(self.bead.index == 1) {
            [views addObject:[self getBeadView:4]];
            [views addObject:[self getBeadView:3]];
            [views addObject:[self getBeadView:2]];
            [views addObject:self];
        } else if(self.bead.index == 2) {
            [views addObject:[self getBeadView:4]];
            [views addObject:[self getBeadView:3]];
            [views addObject:self];
        } else if(self.bead.index == 3) {
            [views addObject:[self getBeadView:4]];
            [views addObject:self];
        } else {
            [views addObject:self];
        }
        NSNumber *y = [NSNumber numberWithFloat:translation.y];
        [views makeObjectsPerformSelector:@selector(moveDown:) withObject:y];
        
        if ([recognizer state] == UIGestureRecognizerStateEnded) {
            [views makeObjectsPerformSelector:@selector(moveDown)];
        }
    } else {
        if(self.bead.index == 2) {
            [views addObject:[self getBeadView:1]];
            [views addObject:self];
        } else if(self.bead.index == 3) {
            [views addObject:[self getBeadView:1]];
            [views addObject:[self getBeadView:2]];
            [views addObject:self];
        } else if(self.bead.index == 4) {
            [views addObject:[self getBeadView:1]];
            [views addObject:[self getBeadView:2]];
            [views addObject:[self getBeadView:3]];
            [views addObject:self];
        } else {
            [views addObject:self];
        }
        NSNumber *y = [NSNumber numberWithFloat:translation.y];
        [views makeObjectsPerformSelector:@selector(moveUp:) withObject:y];
        
        if ([recognizer state] == UIGestureRecognizerStateEnded) {
            [views makeObjectsPerformSelector:@selector(moveUp)];
        }
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];

}

- (void)moveUp:(NSNumber *)y
{
    // y is negative for drag down
    CGFloat moveUpLimit = [self moveUpLimit];
    CGFloat moveTo = self.center.y + y.floatValue - (self.bounds.size.height/2);
    if(moveTo > moveUpLimit) {
        self.center = CGPointMake(self.center.x, self.center.y + y.floatValue);
    }
    
}

- (void)moveDown:(NSNumber *)y
{
    // y is positive for drag up
    CGFloat moveDownLimit = [self moveDownLimit];
    CGFloat moveTo = self.center.y + y.floatValue + (self.bounds.size.height/2);
    if(moveTo < moveDownLimit) {
        self.center = CGPointMake(self.center.x, self.center.y + y.floatValue);
    }
}

- (void)moveUp
{
    CGFloat moveUpLimit = [self moveUpLimit];
    CGFloat moveTo = moveUpLimit + (self.bounds.size.height/2);
    self.center = CGPointMake(self.center.x, moveTo);
}

- (void)moveDown
{
    CGFloat moveDownLimit = [self moveDownLimit];
    CGFloat moveTo = moveDownLimit - (self.bounds.size.height/2);
    self.center = CGPointMake(self.center.x, moveTo);
}

- (CGFloat)moveUpLimit
{
    return [self moveUpLimit:self.bead.index];
}

- (CGFloat)moveUpLimit:(NSUInteger)beadIndex
{
    CGFloat moveUpLimit = 0;
    if(beadIndex == 1) {
        UIView *rowView = [[[[self superview] superview] subviews] firstObject];
        moveUpLimit = rowView.center.y + rowView.bounds.size.height + BEAD_GAP;
    } else if(beadIndex == 2) {
        UIView *firstBeadView = [self getBeadView:1];
        moveUpLimit = firstBeadView.center.y +firstBeadView.bounds.size.height/2 + BEAD_GAP;
    } else if(beadIndex == 3) {
        UIView *secondBeadView = [self getBeadView:2];
        moveUpLimit = secondBeadView.center.y +secondBeadView.bounds.size.height/2 + BEAD_GAP;
    } else if(beadIndex == 4) {
        UIView *thirdBeadView = [self getBeadView:3];
        moveUpLimit = thirdBeadView.center.y +thirdBeadView.bounds.size.height/2 + BEAD_GAP;
    } else if(beadIndex == 5) {
        UIView *columnView = [self superview];
        moveUpLimit = columnView.center.y - columnView.bounds.size.height/2 + BEAD_GAP;
    }
    return moveUpLimit;
}

- (CGFloat)moveDownLimit
{
    return [self moveDownLimit:self.bead.index];
}

- (CGFloat)moveDownLimit:(NSUInteger)beadIndex
{
    CGFloat moveDownLimit = 0;
    if(beadIndex == 1) {
        UIView *secondBeadView = [self getBeadView:2];
        moveDownLimit = secondBeadView.center.y - secondBeadView.bounds.size.height/2 - BEAD_GAP;
    } else if(beadIndex == 2) {
        UIView *thirdBeadView = [self getBeadView:3];
        moveDownLimit = thirdBeadView.center.y - thirdBeadView.bounds.size.height/2 - BEAD_GAP;
    } else if(beadIndex == 3) {
        UIView *fourthBeadView = [self getBeadView:4];
        moveDownLimit = fourthBeadView.center.y - fourthBeadView.bounds.size.height/2 - BEAD_GAP;
    } else if(beadIndex == 4) {
        UIView *columnView = [self superview];
        moveDownLimit = columnView.center.y + columnView.bounds.size.height/2 - BEAD_GAP;
    } else if(beadIndex == 5) {
        UIView *rowView = [[[[self superview] superview] subviews] firstObject];
        moveDownLimit = rowView.center.y - rowView.bounds.size.height - BEAD_GAP;
    }
    return moveDownLimit;
}

- (BeadView *) getBeadView:(NSUInteger)beadIndex
{
    BeadView *beadView;
    switch (beadIndex) {
        case 1:
            beadView =  [[[self superview] subviews] objectAtIndex:4];
            break;
        case 2:
            beadView =  [[[self superview] subviews] objectAtIndex:3];
            break;
        case 3:
            beadView =  [[[self superview] subviews] objectAtIndex:2];
            break;
        case 4:
            beadView =  [[[self superview] subviews] objectAtIndex:1];
            break;
        case 5:
            beadView =  [[[self superview] subviews] objectAtIndex:0];
            break;

        default:
            break;
    }
    return beadView;
}



@end
