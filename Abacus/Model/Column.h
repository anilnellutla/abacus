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

// designated initializer
-(instancetype)initWithPlaceValue:(NSInteger)placeValue beadsPerColumn:(NSInteger)beadsPerColumn;

@property (nonatomic) NSInteger placeValue;

-(Bead *)getBead:(NSInteger)index;

-(void)reset;

-(NSInteger)value;

-(NSInteger)maxValue;

-(void)setValue:(NSInteger)value;

-(BOOL)isPartnerNeeded:(NSInteger)value; 
@end
