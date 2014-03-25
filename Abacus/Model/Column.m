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
        self.numOfBeadsPerColumn = numOfBeadsPerColumn;
        for(int i = 0; i < numOfBeadsPerColumn; i++) {
            Bead *bead = [[Bead alloc] initWithValue:0];
            [self.beads addObject:bead];
        }
    }
    return self;
}

@end
