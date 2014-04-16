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

-(BOOL)canValueBeSet:(NSInteger)value
{
    return (([self value] + value <= [self maxValue]) && ([self value] + value >= 0)) ? YES : NO;
}

- (void) setValue:(NSInteger)value
{
    if (value == 0) {
        return;
    }
    if ([self canValueBeSet:value]) {
        if (value > (5 * _placeValue)) {
            NSInteger valueSet = 0;
            Bead *bead = [self getBeadAtIndex:5];
            //[bead setValue:5 * _placeValue];
            bead.set = YES;
            valueSet = 5 * _placeValue;
            for (int i = 1; i <= 4; i++) {
                if (valueSet == value) {
                    break;
                }
                Bead *bead = [self getBeadAtIndex:i];
                if (![bead isSet]) {
                    //[bead setValue:1 * _placeValue];
                    bead.set = YES;
                    valueSet += 1 * _placeValue;
                }
            }
        } else if (value == 5 * _placeValue) {
            Bead *bead = [self getBeadAtIndex:5];
            //[bead setValue:5 * _placeValue];
            bead.set = YES;
        } else if (value < (5 * _placeValue) && value > 0) {
            NSInteger valueSet = 0;
            for (int i = 1; i <= 4; i++) {
                if (valueSet == value) {
                    break;
                }
                Bead *bead = [self getBeadAtIndex:i];
                if (![bead isSet]) {
                    //[bead setValue:1 * _placeValue];
                    bead.set = YES;
                    valueSet += 1 * _placeValue;
                }
            }
        } else if (value < (-1 * 5 * _placeValue)) {
            Bead *bead = [self getBeadAtIndex:5];
            //[bead setValue:0];
            bead.set = NO;
            NSInteger valueReset = 5 * _placeValue;
            for (int i = 4; i >= 1; i--) {
                if (valueReset == -1 * value) {
                    break;
                }
                Bead *bead = [self getBeadAtIndex:i];
                if ([bead isSet]) {
                    //[bead setValue:0];
                    bead.set = NO;
                    valueReset += 1 * _placeValue;
                }
            }
        } else if (value == (-1 * 5 * _placeValue)) {
            Bead *bead = [self getBeadAtIndex:5];
            //[bead setValue:0];
            bead.set = NO;
        } else if (value > (-1 * 5 * _placeValue) && value < 0) {
            NSInteger valueReset = 0;
            for (int i = 4; i >= 1; i--) {
                if (valueReset == -1 * value) {
                    break;
                }
                Bead *bead = [self getBeadAtIndex:i];
                if ([bead isSet]) {
                    //[bead setValue:0];
                    bead.set = NO;
                    valueReset += 1 * _placeValue;
                }
            }
        }
    }
}

-(BOOL) isPartnerNeeded:(NSInteger)value
{
    if (value == 0) {
        return NO;
    }
    if ([self canValueBeSet:value]) {
        int numOfEmpty1Beads = 0;
        int numOfNonEmpty1Beads = 0;
        for (int i = 1; i <= 4; i++) {
            Bead *bead = [self getBeadAtIndex:i];
            if ([bead isSet]) {
                numOfNonEmpty1Beads++;
            } else {
                numOfEmpty1Beads++;
            }
        }
        Bead *bead = [self getBeadAtIndex:5];
        BOOL isEmpty5Bead = ([bead isSet]) ? NO : YES;
        if (value > (5 * _placeValue)) {
            NSInteger remainingValue = value - (5 * _placeValue);
            return (isEmpty5Bead && (numOfEmpty1Beads * _placeValue >= remainingValue)) ? NO : YES;
        } else if (value == 5 * _placeValue) {
            return isEmpty5Bead ? NO : YES;
        } else if (value < (5 * _placeValue) && value > 0) {
            return (numOfEmpty1Beads * _placeValue >= value) ? NO : YES;
        } else if (value < (-1 * 5 * _placeValue)) {
            NSInteger remainingValue = (-1 * value) - (5 * _placeValue);
            return (!isEmpty5Bead && (numOfNonEmpty1Beads * _placeValue >= remainingValue)) ? NO : YES;
        } else if (value == (-1 * 5 * _placeValue)) {
            return (!isEmpty5Bead) ? NO : YES;
        } else if (value > (-1 * 5 * _placeValue) && value < 0) {
            return (numOfNonEmpty1Beads * _placeValue >= (-1 * value)) ? NO : YES;
        }        
    }
    return YES;
}

@end
