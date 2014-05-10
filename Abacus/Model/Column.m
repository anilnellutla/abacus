//
//  Column.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Column.h"

@interface Column()
@property (strong, nonatomic) NSMutableArray *beads;
@end

@implementation Column

-(instancetype)initWithBeadsPerColumn:(NSInteger)beadsPerColumn placeValue:(NSInteger)placeValue
{
    self = [super init];
    if(self) {
        _placeValue = placeValue;
        _beads = [[NSMutableArray alloc] initWithCapacity:beadsPerColumn];
        for(NSInteger i = 1; i <= beadsPerColumn; i++) {
            Bead *bead = [[Bead alloc] initWithPlaceValue:_placeValue beadIndex:i];
            [_beads addObject:bead];
        }
    }
    return self;
}

-(Bead *)getBeadAtIndex:(NSInteger)beadIndex
{
    for(Bead *bead in self.beads) {
        if([bead beadIndex] == beadIndex) {
            return bead;
        }
    }
    return nil;
}

-(void)reset
{
    for(Bead *bead in self.beads) {
        bead.set = NO;
    }
}

-(NSInteger)value
{
    NSInteger value = 0;
    for(Bead *bead in self.beads) {
        value += [bead getValue];
    }
    return value;
}

-(NSInteger)maxValue
{
    return 9 * _placeValue;
}

@end
