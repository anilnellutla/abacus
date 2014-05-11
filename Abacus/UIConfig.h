//
//  UIConstraints.h
//  Abacus
//
//  Created by Anil K Nellutla on 4/15/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIConfig : NSObject
+(CGRect) getAbacusViewBounds:(CGRect)containerViewBounds;
+(CGRect) getNumberViewBounds:(CGRect)containerViewBounds;
+(CGRect) getAbacusValueViewBounds:(CGRect)containerViewBounds;
+(CGRect) getColumnViewBounds:(CGRect)abacusViewBounds forColumn:(NSInteger)columnIndex;
+(CGRect) getRowViewBounds:(CGRect)abacusBounds;
+(CGRect) getColumnBounds:(CGRect)columnViewBounds;
+(CGRect) getBeadViewBounds:(CGRect)columnViewBounds forBead:(NSInteger)beadIndex;
+(CGRect)getDigitViewBounds:(CGRect)numberViewBounds forDigit:(NSInteger)digitIndex;
+(CGRect)getDigitLabelBounds:(CGRect)digitViewBounds;
@end
