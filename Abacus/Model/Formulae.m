//
//  Formulae.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/7/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "Formulae.h"
#import "Util.h"

@implementation Formulae
+(Partners *) getPartners:(NSInteger)value
{
    NSInteger digit = [Util leftMostDigit:value];
    NSInteger placeValue = [Util leftMostDigitPlaceValue:value];
    
    Partners *partners;
    switch (digit) {
        case 1:
            partners = [[Partners alloc] initWithOperands:5 * placeValue and:-4 * placeValue];
			return partners;
            
		case 2:
            partners = [[Partners alloc] initWithOperands:5 * placeValue and:-3 * placeValue];
			return partners;
            
		case 3:
            partners = [[Partners alloc] initWithOperands:5 * placeValue and:-2 * placeValue];
			return partners;
            
		case 4:
            partners = [[Partners alloc] initWithOperands:5 * placeValue and:-1 * placeValue];
			return partners;
            
		case 5:
            partners = [[Partners alloc] initWithOperands:10 * placeValue and:-5 * placeValue];
			return partners;
            
		case 6:
            partners = [[Partners alloc] initWithOperands:10 * placeValue and:-4 * placeValue];
			return partners;
            
		case 7:
            partners = [[Partners alloc] initWithOperands:10 * placeValue and:-3 * placeValue];
			return partners;
            
		case 8:
            partners = [[Partners alloc] initWithOperands:10 * placeValue and:-2 * placeValue];
			return partners;
            
		case 9:
            partners = [[Partners alloc] initWithOperands:10 * placeValue and:-1 * placeValue];
			return partners;
            
		case -1:
            partners = [[Partners alloc] initWithOperands:-5 * placeValue and:4 * placeValue];
			return partners;
            
		case -2:
            partners = [[Partners alloc] initWithOperands:-5 * placeValue and:3 * placeValue];
			return partners;
            
		case -3:
            partners = [[Partners alloc] initWithOperands:-5 * placeValue and:2 * placeValue];
			return partners;
            
		case -4:
            partners = [[Partners alloc] initWithOperands:-5 * placeValue and:1 * placeValue];
			return partners;
            
		case -5:
            partners = [[Partners alloc] initWithOperands:-10 * placeValue and:5 * placeValue];
			return partners;
            
		case -6:
            partners = [[Partners alloc] initWithOperands:-10 * placeValue and:4 * placeValue];
			return partners;
            
		case -7:
            partners = [[Partners alloc] initWithOperands:-10 * placeValue and:3 * placeValue];
			return partners;
            
		case -8:
            partners = [[Partners alloc] initWithOperands:-10 * placeValue and:2 * placeValue];
			return partners;
            
		case -9:
            partners = [[Partners alloc] initWithOperands:-10 * placeValue and:1 * placeValue];
			return partners;
    }
    
    partners = [[Partners alloc] initWithOperands:0 and:0];
    return partners;
}
@end
