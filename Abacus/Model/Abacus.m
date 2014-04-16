//
//  Abacus.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Abacus.h"
#import "Util.h"
#import "Formulae.h"

@interface Abacus()
@property (strong, nonatomic) NSMutableArray *columns;
@property (nonatomic) NSInteger numOfColumns;
@property (nonatomic) NSInteger beadsPerColumn;
@end

@implementation Abacus

-(instancetype)initWithNumberOfColumns:(NSInteger)numOfColumns beadsPerColumn:(NSInteger)beadsPerColumn
{
    self = [super init];
    if(self) {
        _numOfColumns = numOfColumns;
        _beadsPerColumn = beadsPerColumn;
        _columns = [[NSMutableArray alloc] initWithCapacity:numOfColumns];
        NSInteger placeValue = 1;
        for(NSInteger i = 0; i < numOfColumns; i++) {
            Column *column = [[Column alloc] initWithBeadsPerColumn:beadsPerColumn placeValue:placeValue];
            [_columns addObject:column];
            placeValue *= 10;
        }
    }
    return self;
}

-(NSMutableArray *)expression
{
    if(!_expression) {
        _expression = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return _expression;
}

-(void)reset
{
    for(Column *column in self.columns) {
        [column reset];
    }
}

-(NSInteger)value
{
    NSInteger value = 0;
    for(Column *column in self.columns) {
        value += [column value];
    }
    return value;
}

-(Column *)getColumn:(NSInteger)placeValue
{
    for(Column *column in self.columns) {
        if([column placeValue] == placeValue) {
            return column;
        }
    }
    
    return nil;
}

-(void)setColumnValue:(NSInteger)value
{
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    [[self getColumn:placeValue] setValue:value];
}

-(NSInteger) getColumnValue:(NSInteger)placeValue
{
    return [[self getColumn:placeValue] value];
}

-(BOOL)isPartnerNeeded:(NSInteger)value
{
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    return [[self getColumn:placeValue ] isPartnerNeeded:value];
}

-(void)add:(NSInteger)number
{
    [self add:number to:0];
}

-(void)subtract:(NSInteger)number
{
    [self add:-1*number to:0];
}

-(void) add:(NSInteger)number1 to:(NSInteger)number2
{
    NSArray *digits = [Util digits:number1];
    for(NSNumber *digit in digits) {
        [self setValue:digit.longValue];
    }
    
    digits = [Util digits:number2];
    for(NSNumber *digit in digits) {
        [self setValue:digit.longValue];
    }    
}

-(void) subtract:(NSInteger)number1 from:(NSInteger)number2
{
    [self add:number2 to:-1*number1];
}

-(void)setValue:(NSInteger)value
{
    if ([self isPartnerNeeded:value]) {
        Partners *partners = [Formulae getPartners:value];
        if ([self isPartnerNeeded:[partners operand1]]) {
            [self setValue:[partners operand1]];
        } else {
            [[self expression] addObject:[[NSNumber alloc] initWithInteger:[partners operand1]]];
            [self setColumnValue:[partners operand1]];
        }
        
        if ([self isPartnerNeeded:[partners operand2]]) {
            [self setValue:[partners operand2]];
        } else {
            [[self expression] addObject:[[NSNumber alloc] initWithInteger:[partners operand2]]];
            [self setColumnValue:[partners operand2]];
        }
    } else {
        [[self expression] addObject:[[NSNumber alloc] initWithInteger:value]];
        [self setColumnValue:value];
    }
}

-(void)resetExpression
{
    [[self expression] removeAllObjects];
}

-(NSString*)description
{
    NSMutableString *abacusStr = [[NSMutableString alloc] init];
    
    [abacusStr appendString:@"\n"];
    for(NSInteger i = 0; i < [self numOfColumns]; i++) {
        [abacusStr appendString:@"***"];
    }
    [abacusStr appendString:@"\n"];
    
    NSInteger placeValue = pow(10, [self numOfColumns]-1);
    for(NSInteger i = 0; i < [self numOfColumns]; i++) {
        Column *column = [self getColumn:placeValue];
        placeValue = placeValue/10;
        Bead *bead = [column getBeadAtIndex:5];
        if([bead isSet]) {
            [abacusStr appendString:@" - "];
        } else {
            if (i == ([self numOfColumns] - 1)) {
                [abacusStr appendString:@"| "];
            } else {
                [abacusStr appendString:@" | "];
            }
        }
    }
    
    [abacusStr appendString:@"\n"];
    for(NSInteger i = 0; i < [self numOfColumns]; i++) {
        [abacusStr appendString:@"***"];
    }
    
    for(NSInteger j = 1; j <= [self beadsPerColumn] - 1; j++) {
        [abacusStr appendString:@"\n"];
        placeValue = pow(10, [self numOfColumns] - 1);
        for(NSInteger i = 0; i < [self numOfColumns]; i++) {
            Column *column = [self getColumn:placeValue];
            placeValue = placeValue/10;
            Bead *bead = [column getBeadAtIndex:j];
            if([bead isSet]) {
                [abacusStr appendString:@" - "];
            } else {
                if (i == ([self numOfColumns] - 1)) {
                    [abacusStr appendString:@"| "];
                } else {
                    [abacusStr appendString:@" | "];
                }
            }
        }
        [abacusStr appendString:@"\n"];
    }
    
    for(NSInteger i = 0; i < [self numOfColumns]; i++) {
        [abacusStr appendString:@"***"];
    }
    [abacusStr appendString:@"\n"];
    return abacusStr;
}

@end
