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

@property (strong, nonatomic) NSMutableArray *expression;

//designated initializer
-(instancetype)initWithNumberOfColumns:(NSInteger)numOfColumns beadsPerColumn:(NSInteger)beadsPerColumn;

-(Column *)getColumn:(NSInteger)placeValue;

-(void)reset;

-(NSInteger)value;

-(void)add:(NSInteger)number;

-(void)subtract:(NSInteger)number;

-(void)add:(NSInteger)number1 to:(NSInteger)number2;

-(void)subtract:(NSInteger)number1 from:(NSInteger)number2;

@end
