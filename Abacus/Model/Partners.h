//
//  Partners.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/7/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Partners : NSObject

// designated initializer
-(instancetype)initWithOperands:(NSInteger)operand1 and:(NSInteger)operand2;

@property (nonatomic) NSUInteger operand1;
@property (nonatomic) NSUInteger operand2;
@end
