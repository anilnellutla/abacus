//
//  Addition.h
//  Abacus
//
//  Created by Anil K Nellutla on 5/10/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Operation.h"
#import "Abacus.h"

@interface AddOperation : Operation

-(instancetype) initWithAbacus:(Abacus*)abacus;

-(void)add:(NSInteger)number;
-(void)add:(NSInteger)number1 to:(NSInteger)number2;

@end
