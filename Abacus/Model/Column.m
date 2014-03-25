//
//  Column.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Column.h"

@implementation Column

-(instancetype)initWithPlaceValue:(NSUInteger)placeValue beadsPerColumn:(NSUInteger)numOfBeadsPerColumn
{
    self = [super init];
    if(self) {
        self.placeValue = placeValue;
        for(int i = 0; i < numOfBeadsPerColumn; i++) {
            Bead *bead = [[Bead alloc] initWithValue:0];
            [self.beads addObject:bead];
        }
    }
    return self;
}

-(NSMutableArray *) beads {
    if(!_beads) {
        _beads = [[NSMutableArray alloc] init];
    }
    return _beads;
}

-(void)reset
{
    for(Bead *bead in self.beads) {
        bead.value = 0;
    }
}

-(NSInteger)value
{
    NSInteger value = 0;
    for(Bead *bead in self.beads) {
        value += [bead value];
    }
    return value;
}

-(NSInteger)maxValue
{
    return 9 * _placeValue;
}

-(BOOL)canValueBeSet:(NSInteger)value
{
    return (([self value] + value <= [self maxValue]) && ([self value] + value >= 0)) ? YES : NO;
}

@end
