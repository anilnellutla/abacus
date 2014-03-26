//
//  BeadView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "BeadView.h"

@implementation BeadView


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

- (void)setBead:(Bead *)bead
{
    _bead = bead;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 0;
    [[UIColor blueColor] setFill];
    [path fill];
    [[UIColor blueColor] setStroke];
    [path stroke];
    
    /*
    UISwipeGestureRecognizer *swipeUp=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp:)];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer *swipeDown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction=UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipeUp];
    [self addGestureRecognizer:swipeDown];
    */
    
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self addGestureRecognizer:panRecognizer];
}

-(void)swipeUp:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"swipeUp");
    CGRect frame = self.frame;
    frame.origin.y -= 5;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = frame;
    }];
}

-(void)swipeDown:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"swipeDown");
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    NSLog(@"move");
    CGPoint translation = [recognizer translationInView:self];
    CGPoint velocity = [recognizer velocityInView:self];
    BOOL panDown = NO;
    if(velocity.y > 0) {
        panDown = YES;
        NSLog(@"bead moving down");
    } else {
        NSLog(@"bead moving up");
    }
    
    NSUInteger beadIndex = self.beadIndex;
    
    if(beadIndex == 1) {
        NSLog(@"bead 1 move");
        
        if(panDown == YES) {
            
        } else {
            UIView *rowView = [[[[self superview] superview] subviews] firstObject];
            CGFloat yLimit = rowView.center.y + rowView.bounds.size.height;

            if(recognizer.view.center.y + translation.y - (self.bounds.size.height/2) > yLimit) {
                recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                                     recognizer.view.center.y + translation.y);
            }
        }

    } else if(beadIndex == 2) {
        NSLog(@"bead 2 move");
        recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                             recognizer.view.center.y + translation.y);
    } else if(beadIndex == 3) {
        NSLog(@"bead 3 move");
        recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                             recognizer.view.center.y + translation.y);
    } else if(beadIndex == 4) {
        NSLog(@"bead 4 move");
        recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                             recognizer.view.center.y + translation.y);
    } else if(beadIndex == 5) {
        NSLog(@"bead 5 move");
        recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                             recognizer.view.center.y + translation.y);
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];

}



@end
