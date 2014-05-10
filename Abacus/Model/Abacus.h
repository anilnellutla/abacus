//
//  Abacus.h
//  Abacus
//
//  Created by Anil K Nellutla on 3/24/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Column.h"

@interface Abacus : NSObject

@property (nonatomic) NSInteger numOfColumns;
@property (nonatomic) NSInteger beadsPerColumn;

//designated initializer
-(instancetype)initWithNumberOfColumns:(NSInteger)numOfColumns beadsPerColumn:(NSInteger)beadsPerColumn;

-(Column *)getColumn:(NSInteger)placeValue;

-(void)reset;

-(NSInteger)value;

-(NSInteger) getColumnValue:(NSInteger)placeValue;

@end
