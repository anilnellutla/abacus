//
//  Abacus.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Abacus.h"
#import "Util.h"

@interface Abacus()
@property (strong, nonatomic) NSMutableArray *columns;
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

-(NSInteger) getColumnValue:(NSInteger)placeValue
{
    return [[self getColumn:placeValue] value];
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
