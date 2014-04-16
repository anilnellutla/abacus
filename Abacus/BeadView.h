//
//  BeadView.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/23/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bead.h"

@interface BeadView : UIView

@property (nonatomic) NSInteger placeValue;
@property (nonatomic) NSInteger beadIndex;

// designated initializer
- (id)initWithFrame:(CGRect)frame placeValue:(NSInteger)placeValue beadIndex:(NSInteger)beadIndex;
- (BOOL)isSet;
- (BOOL)isReset;

@end
