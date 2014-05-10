//
//  SubtractOperation.h
//  Abacus
//
//  Created by Anil K Nellutla on 5/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AddOperation.h"

@interface SubtractOperation : AddOperation

-(void)subtract:(NSInteger)number;
-(void)subtract:(NSInteger)number1 from:(NSInteger)number2;

@end
