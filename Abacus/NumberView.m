//
//  NumberView.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "NumberView.h"

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
    NSLog(@"NumberView");
    // Drawing code
    /*
    UIView *superView = [self superview];
    UIView *abacusView = [[[self superview] subviews] objectAtIndex:0];
    UIView *columnView = [[abacusView subviews] objectAtIndex:0];
    UIView *beadView = [[columnView subviews] objectAtIndex:0];
    
    CGRect numberBounds  = CGRectMake(abacusView.bounds.origin.x, abacusView.bounds.origin.y - 2*beadView.bounds.size.height,
                                  abacusView.bounds.size.width, 1.75*beadView.bounds.size.height);
    
    UIBezierPath *numberPath = [UIBezierPath bezierPathWithRect:numberBounds];
    [numberPath addClip];
    
    [[UIColor redColor] setFill];
    [numberPath fill];
    */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [path addClip];
    
    [[UIColor redColor] setFill];
    [path fill];


}


@end
