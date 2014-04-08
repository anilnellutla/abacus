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
-(instancetype)initWithPlaceValue:(NSUInteger)placeValue;

@property (nonatomic) NSUInteger placeValue;

-(void)addBead:(Bead *)bead;

-(void)reset;

-(NSInteger)value;

-(NSInteger)maxValue;

-(BOOL)canValueBeSet:(NSInteger)value;

-(void)setValue:(NSInteger)value;

-(BOOL)isPartnerNeeded:(NSInteger)value; 
@end
