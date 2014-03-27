//
//  BeadBehavior.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/26/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "BeadBehavior.h"

@interface BeadBehavior() < UICollisionBehaviorDelegate>
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIPushBehavior *push;
@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;
@end

@implementation BeadBehavior

- (instancetype)init
{
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    //[self addChildBehavior:self.push];
    [self addChildBehavior:self.animationOptions];
    return self;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = -0.9;
    }
    return _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        _collider.collisionDelegate = self;
    }
    return _collider;
}

- (UIPushBehavior *)push
{
    if (!_push) {
        _push = [[UIPushBehavior alloc] init];
    }
    return _push;
}

- (UIDynamicItemBehavior *)animationOptions
{
    if (!_animationOptions) {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        _animationOptions.allowsRotation = NO;
        _animationOptions.friction = 1.0;
    }
    return _animationOptions;
}

- (void)addItem:(id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    //[self.push addItem:item];
    //[self.push setActive:YES];
    //[self.push setPushDirection:CGVectorMake(0.0f, 1.0f)];
    [self.animationOptions addItem:item];

}

- (void)removeItem:(id <UIDynamicItem>)item;
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animationOptions removeItem:item];
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior
      beganContactForItem:(id <UIDynamicItem>)item1
                 withItem:(id <UIDynamicItem>)item2
                  atPoint:(CGPoint)p
{
    NSLog(@"collisionBehavior");
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    NSLog(@"Boundary contact occurred - %@", identifier);
}

@end
