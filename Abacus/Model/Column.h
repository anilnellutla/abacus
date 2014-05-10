//
//  Column.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bead.h"

@interface Column : NSObject

@property (nonatomic) NSInteger placeValue;

// designated initializer
-(instancetype)initWithBeadsPerColumn:(NSInteger)beadsPerColumn placeValue:(NSInteger)placeValue;

-(Bead *)getBeadAtIndex:(NSInteger)beadIndex;

-(void)reset;

-(NSInteger)value;

-(NSInteger)maxValue;

@end
