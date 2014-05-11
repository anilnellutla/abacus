//
//  Calculator.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/8/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Abacus.h"
#import "AddOperation.h"
#import "SubtractOperation.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Abacus *abacus;

// designated initializer
-(instancetype) initWithAbacus:(Abacus*)abacus;

-(void)performAdd:(NSInteger)number;

-(void)performSubtract:(NSInteger)number;

-(void)performAdd:(NSInteger)number1 to:(NSInteger)number2;

-(void)performSubtract:(NSInteger)number1 from:(NSInteger)number2;

@property (strong, nonatomic) NSMutableArray *expression;

@end
