//
//  BeadBehavior.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/26/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeadBehavior : UIDynamicBehavior
- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
@end
