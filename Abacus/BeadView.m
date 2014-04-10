//
//  BeadView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "BeadView.h"
#import "BeadBehavior.h"

@interface BeadView()
@property (strong, nonatomic) NSString *initialMoveDirection;
@end

@implementation BeadView

static const CGFloat BEAD_GAP = 2;

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

- (UIColor *)beadColor
{
    return [UIColor colorWithRed:0.45 green:0.2 blue:0.02 alpha:1.0];
    //return [UIColor colorWithRed:0.99 green:0.75 blue:0.83 alpha:1.0];
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
    BOOL dragUp = NO;
    if(velocity.y < 0) {
        dragUp = YES;
    }
    
    if(dragUp == YES) {
        
        if ([recognizer state] == UIGestureRecognizerStateBegan) {
            _initialMoveDirection = @"moveUp";
        }
        
        if(translation.y < 0) {
            [self moveUp:translation.y];
        }
        
        if([[self initialMoveDirection] isEqualToString:@"moveDown"]) {
            BeadView *bottomAnchorBead = [[self getBottomBead] getBottomAnchorBead];
            if(![bottomAnchorBead isReset]) {
                [bottomAnchorBead moveUp:translation.y];
            }
        }
        
        if ([recognizer state] == UIGestureRecognizerStateEnded) {
            if([self shouldAutoMoveDown]) {
                BeadView *topAnchorBead = [self getTopAnchorBead];
                if(![topAnchorBead isSet]) {
                    [topAnchorBead moveDown];
                }
            } else {
                BeadView *bottomAnchorBead = [self getBottomAnchorBead];
                if(![bottomAnchorBead isReset]) {
                    [bottomAnchorBead moveUp];
                }
            }
        }
        
    } else {
        
        if ([recognizer state] == UIGestureRecognizerStateBegan) {
            _initialMoveDirection = @"moveDown";
        }
        
        if(translation.y > 0) {
            [self moveDown:translation.y];
        }
        
        if([[self initialMoveDirection] isEqualToString:@"moveUp"]) {
            BeadView *topAnchorBead = [[self getTopBead] getTopAnchorBead];
            if(![topAnchorBead isSet]) {
                [topAnchorBead moveDown:translation.y];
            }
        }
        
        if ([recognizer state] == UIGestureRecognizerStateEnded) {
            if([self shouldAutoMoveUp]) {
                BeadView *bottomAnchorBead = [self getBottomAnchorBead];
                if(![bottomAnchorBead isReset]) {
                    [bottomAnchorBead moveUp];
                }
            } else {
                BeadView *topAnchorBead = [self getTopAnchorBead];
                if(![topAnchorBead isSet]) {
                    [topAnchorBead moveDown];
                }
            }
        }
        
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
    
}

- (void)moveUp:(CGFloat)y
{
    // y is negative for drag up
    BeadView *beadView = [self getAdjacentTopBead];
    [beadView moveUp:y];
    
    CGFloat moveUpLimit = [self moveUpLimit];
    CGFloat moveTo = self.center.y + y - (self.bounds.size.height/2);
    if(moveTo > moveUpLimit) {
        self.center = CGPointMake(self.center.x, self.center.y + y);
    } else {
        self.center = CGPointMake(self.center.x, moveUpLimit + self.bounds.size.height/2);
    }
    
}

- (void)moveDown:(CGFloat)y
{
    // y is positive for drag down
    BeadView *beadView = [self getAdjacentBottomBead];
    [beadView moveDown:y];
    
    CGFloat moveDownLimit = [self moveDownLimit];
    CGFloat moveTo = self.center.y + y + (self.bounds.size.height/2);
    if(moveTo < moveDownLimit) {
        self.center = CGPointMake(self.center.x, self.center.y + y);
    } else {
        self.center = CGPointMake(self.center.x, moveDownLimit - self.bounds.size.height/2);
    }
}

- (void)moveUp
{
    BeadView *beadView = [self getAdjacentTopBead];
    [beadView moveUp];
    
    CGFloat moveUpLimit = [self moveUpLimit];
    CGFloat moveTo = moveUpLimit + (self.bounds.size.height/2);
    //self.center = CGPointMake(self.center.x, moveTo);
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.center = CGPointMake(self.center.x, moveTo);
                     }
                     completion:^(BOOL finished) {
                     
                     }
     ];
}

- (void)moveDown
{
    BeadView *beadView = [self getAdjacentBottomBead];
    [beadView moveDown];
    
    CGFloat moveDownLimit = [self moveDownLimit];
    CGFloat moveTo = moveDownLimit - (self.bounds.size.height/2);
    //self.center = CGPointMake(self.center.x, moveTo);
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.center = CGPointMake(self.center.x, moveTo);
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
}

- (CGFloat)moveUpLimit
{
    return [self moveUpLimit:self.beadIndex];
}

- (CGFloat)moveUpLimit:(NSInteger)beadIndex
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
    return [self moveDownLimit:self.beadIndex];
}

- (CGFloat)moveDownLimit:(NSInteger)beadIndex
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

- (BeadView *) getBottomBead
{
    BeadView *adjacentBeadView;
    switch (self.beadIndex) {
        case 1:
            adjacentBeadView =  [self getBeadView:2];
            break;
        case 2:
            adjacentBeadView =  [self getBeadView:3];
            break;
        case 3:
            adjacentBeadView =  [self getBeadView:4];
            break;
        default:
            break;
    }
    return adjacentBeadView;
}

- (BeadView *) getTopBead
{
    BeadView *adjacentBeadView;
    switch (self.beadIndex) {
        case 2:
            adjacentBeadView =  [self getBeadView:1];
            break;
        case 3:
            adjacentBeadView =  [self getBeadView:2];
            break;
        case 4:
            adjacentBeadView =  [self getBeadView:3];
            break;
        default:
            break;
    }
    return adjacentBeadView;
}

- (BeadView *) getAdjacentBottomBead
{
    BeadView *adjacentBeadView = [self getBottomBead];
    if(adjacentBeadView) {
        if((adjacentBeadView.center.y - adjacentBeadView.bounds.size.height/2)
           - (self.center.y + self.bounds.size.height/2) ==  BEAD_GAP ) {
            return adjacentBeadView;
        }
    }
    return nil;
}

- (BeadView *) getAdjacentTopBead
{
    BeadView *adjacentBeadView = [self getTopBead];
    if(adjacentBeadView) {
        if((self.center.y - self.bounds.size.height/2)
           - (adjacentBeadView.center.y + adjacentBeadView.bounds.size.height/2) == BEAD_GAP ) {
            return adjacentBeadView;
        }
    }
    return nil;
}

- (BeadView *) getBottomAnchorBead
{
    BeadView *anchorBead;
    if(self.beadIndex == 4 || self.beadIndex == 5) {
        anchorBead = self;
    } else {
        anchorBead = self;
        while([anchorBead getAdjacentBottomBead]) {
            anchorBead = [anchorBead getAdjacentBottomBead];
        }
    }
    
    return anchorBead;
}

- (BeadView *) getTopAnchorBead
{
    BeadView *anchorBead;
    if(self.beadIndex == 1 || self.beadIndex == 5) {
        anchorBead = self;
    } else {
        anchorBead = self;
        while([anchorBead getAdjacentTopBead]) {
            anchorBead = [anchorBead getAdjacentTopBead];
        }
    }
    
    return anchorBead;
}
- (BeadView *) getBeadView:(NSInteger)beadIndex
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

- (BOOL)shouldAutoMoveDown
{
    CGFloat moveDownLimit = [self moveDownLimit];
    CGFloat moveDistance = moveDownLimit - (self.center.y + self.bounds.size.height/2);
    if(moveDistance > BEAD_GAP && moveDistance < (3 * self.bounds.size.height)/4) {
        return YES;
    }
    return NO;
}

- (BOOL)shouldAutoMoveUp
{
    CGFloat moveUpLimit = [self moveUpLimit];
    CGFloat moveDistance = (self.center.y - self.bounds.size.height/2) - moveUpLimit;
    if(moveDistance > BEAD_GAP && moveDistance < (3 * self.bounds.size.height)/4) {
        return YES;
    }
    return NO;
}

- (BOOL)isSet
{
    
    if(self.beadIndex == 1) {
        if((self.center.y - self.bounds.size.height/2) <= [self moveUpLimit]) {
            return YES;
        }
    } else if(self.beadIndex == 2) {
        if([[self getBeadView:1] isSet]) {
            if((self.center.y - self.bounds.size.height/2) <= [self moveUpLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 3) {
        if([[self getBeadView:2] isSet]) {
            if((self.center.y - self.bounds.size.height/2) <= [self moveUpLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 4) {
        if([[self getBeadView:3] isSet]) {
            if((self.center.y - self.bounds.size.height/2) <= [self moveUpLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 5) {
        if((self.center.y + self.bounds.size.height/2) >= [self moveDownLimit]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isReset
{
    
    if(self.beadIndex == 4) {
        if((self.center.y + self.bounds.size.height/2) >= [self moveDownLimit]) {
            return YES;
        }
    } else if(self.beadIndex == 3) {
        if([[self getBeadView:4] isReset]) {
            if((self.center.y + self.bounds.size.height/2) >= [self moveDownLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 2) {
        if([[self getBeadView:3] isReset]) {
            if((self.center.y + self.bounds.size.height/2) >= [self moveDownLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 1) {
        if([[self getBeadView:2 ] isReset]) {
            if((self.center.y + self.bounds.size.height/2) >= [self moveDownLimit]) {
                return YES;
            }
        }
    } else if(self.beadIndex == 5) {
        if((self.center.y - self.bounds.size.height/2) <= [self moveUpLimit]) {
            return YES;
        }
    }
    return NO;
}

- (void)set
{
    [self moveUp];
}

- (void)reset
{
    [self moveDown];
}


@end
