//
//  Calculator.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/8/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Abacus.h"

@interface Calculator : NSObject

// designated initializer
-(instancetype)initWithAbacus:(Abacus*)abacus;

-(NSInteger) add:(NSInteger)number1 to:(NSInteger)number2;

-(NSInteger) subtract:(NSInteger)number1 from:(NSInteger)number2;

@end
