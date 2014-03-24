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

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    NSLog(@"move");
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x ,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
}



@end
