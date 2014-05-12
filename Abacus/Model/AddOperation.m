//
//  Addition.m
//  Abacus
//
//  Created by Anil K Nellutla on 5/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AddOperation.h"
#import "Util.h"
#import "Formulae.h"

@implementation AddOperation

-(instancetype)initWithAbacus:(Abacus*)abacus
{
    self = [super init];
    if(self) {
        self.abacus = abacus;
        self.expression = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

-(void)add:(NSInteger)number
{
    [self add:number to:0];
}

-(void)add:(NSInteger)number1 to:(NSInteger)number2
{
    [self resetExpression];

    NSArray *digits = [Util digits:number1];
    for(NSNumber *digit in digits) {
        [self setAbacusValue:digit.longValue];
    }
    
    digits = [Util digits:number2];
    for(NSNumber *digit in digits) {
        [self setAbacusValue:digit.longValue];
    }
}

-(void)setAbacusValue:(NSInteger)value
{
    if ([self isPartnerNeeded:value]) {
        Partners *partners = [Formulae getPartners:value];
        if ([self isPartnerNeeded:[partners operand1]]) {
            [self setAbacusValue:[partners operand1]];
        } else {
            [self addDigitToExpression:[partners operand1]];
            [self setColumnValue:[partners operand1]];
        }
        
        if ([self isPartnerNeeded:[partners operand2]]) {
            [self setAbacusValue:[partners operand2]];
        } else {
            [self addDigitToExpression:[partners operand2]];
            [self setColumnValue:[partners operand2]];
        }
    } else {
        [self addDigitToExpression:value];
        [self setColumnValue:value];
    }
}

-(BOOL)isPartnerNeeded:(NSInteger)value
{
    if (value == 0) {
        return NO;
    }
    
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    Column *column = [[self abacus]getColumn:placeValue];
    
    if ([self canValueBeSet:value forColumn:column]) {
        int numOfEmpty1Beads = 0;
        int numOfNonEmpty1Beads = 0;
        for (int i = 1; i <= 4; i++) {
            Bead *bead = [column getBeadAtIndex:i];
            if ([bead isSet]) {
                numOfNonEmpty1Beads++;
            } else {
                numOfEmpty1Beads++;
            }
        }
        Bead *bead = [column getBeadAtIndex:5];
        BOOL isEmpty5Bead = ([bead isSet]) ? NO : YES;
        if (value > (5 * [column placeValue])) {
            NSInteger remainingValue = value - (5 * [column placeValue]);
            return (isEmpty5Bead && (numOfEmpty1Beads * [column placeValue] >= remainingValue)) ? NO : YES;
        } else if (value == 5 * [column placeValue]) {
            return isEmpty5Bead ? NO : YES;
        } else if (value < (5 * [column placeValue]) && value > 0) {
            return (numOfEmpty1Beads * [column placeValue] >= value) ? NO : YES;
        } else if (value < (-1 * 5 * [column placeValue])) {
            NSInteger remainingValue = (-1 * value) - (5 * [column placeValue]);
            return (!isEmpty5Bead && (numOfNonEmpty1Beads * [column placeValue] >= remainingValue)) ? NO : YES;
        } else if (value == (-1 * 5 * [column placeValue])) {
            return (!isEmpty5Bead) ? NO : YES;
        } else if (value > (-1 * 5 * [column placeValue]) && value < 0) {
            return (numOfNonEmpty1Beads * [column placeValue] >= (-1 * value)) ? NO : YES;
        }
    }
    return YES;
}

-(void)setColumnValue:(NSInteger)value
{
    if (value == 0) {
        return;
    }
    
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    Column *column = [[self abacus]getColumn:placeValue];

    if ([self canValueBeSet:value forColumn:column]) {
        if (value > (5 * [column placeValue])) {
            NSInteger valueSet = 0;
            Bead *bead = [column getBeadAtIndex:5];
            bead.set = YES;
            valueSet = 5 * [column placeValue];
            for (int i = 1; i <= 4; i++) {
                if (valueSet == value) {
                    break;
                }
                Bead *bead = [column getBeadAtIndex:i];
                if (![bead isSet]) {
                    bead.set = YES;
                    valueSet += 1 * [column placeValue];
                }
            }
        } else if (value == 5 * [column placeValue]) {
            Bead *bead = [column getBeadAtIndex:5];
            bead.set = YES;
        } else if (value < (5 * [column placeValue]) && value > 0) {
            NSInteger valueSet = 0;
            for (int i = 1; i <= 4; i++) {
                if (valueSet == value) {
                    break;
                }
                Bead *bead = [column getBeadAtIndex:i];
                if (![bead isSet]) {
                    bead.set = YES;
                    valueSet += 1 * [column placeValue];
                }
            }
        } else if (value < (-1 * 5 * [column placeValue])) {
            Bead *bead = [column getBeadAtIndex:5];
            bead.set = NO;
            NSInteger valueReset = 5 * [column placeValue];
            for (int i = 4; i >= 1; i--) {
                if (valueReset == -1 * value) {
                    break;
                }
                Bead *bead = [column getBeadAtIndex:i];
                if ([bead isSet]) {
                    bead.set = NO;
                    valueReset += 1 * [column placeValue];
                }
            }
        } else if (value == (-1 * 5 * [column placeValue])) {
            Bead *bead = [column getBeadAtIndex:5];
            bead.set = NO;
        } else if (value > (-1 * 5 * [column placeValue]) && value < 0) {
            NSInteger valueReset = 0;
            for (int i = 4; i >= 1; i--) {
                if (valueReset == -1 * value) {
                    break;
                }
                Bead *bead = [column getBeadAtIndex:i];
                if ([bead isSet]) {
                    bead.set = NO;
                    valueReset += 1 * [column placeValue];
                }
            }
        }
    }
}

-(BOOL)canValueBeSet:(NSInteger)value forColumn:(Column*)column
{
    return (([column value] + value <= [column maxValue]) && ([column value] + value >= 0)) ? YES : NO;
}

-(void)addDigitToExpression:(NSInteger)digit
{
    if(digit != 0) {
        NSInteger placeValue = [Util leftMostDigitPlaceValue:digit];
        NSInteger previousDigit = [(NSString*)[[self expression] lastObject] intValue];
        NSInteger previousDigitPlaceValue = [Util leftMostDigitPlaceValue:previousDigit];
        if(placeValue == previousDigitPlaceValue) {
            if((previousDigit > 0 && digit > 0) || (previousDigit < 0 && digit < 0)) {
                digit += previousDigit;
            }
        }
        
        if(placeValue == previousDigitPlaceValue) {
            if((previousDigit > 0 && digit > 0) || (previousDigit < 0 && digit < 0)) {
                if([[self expression] count] > 0) {
                    NSInteger lastIndex = [[self expression] count] - 1;
                    [[self expression] replaceObjectAtIndex:lastIndex withObject:[NSString stringWithFormat:@"%ld", digit]];
                } else {
                    [[self expression] addObject:[NSString stringWithFormat:@"%ld", digit]];
                }
            } else {
                [[self expression] addObject:[NSString stringWithFormat:@"%ld", digit]];
            }
        } else {
            [[self expression] addObject:[NSString stringWithFormat:@"%ld", digit]];
        }
    }
}

@end
