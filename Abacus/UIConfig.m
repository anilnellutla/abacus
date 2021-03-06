//
//  UIConstraints.m
//  Abacus
//
//  Created by Anil K Nellutla on 4/15/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "UIConfig.h"
#import "UIConstants.h"
#import "AbacusConstants.h"

@implementation UIConfig

+(CGRect) getAbacusViewBounds:(CGRect)containerViewBounds
{
    return CGRectMake(ABACUS_VIEW_ORIGIN_X_OFFSET,
                      containerViewBounds.size.height -
                      ABACUS_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height -
                      ABACUS_VIEW_OFFSET_FROM_BASE,
                      ABACUS_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      ABACUS_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
}

+(CGRect) getNumberViewBounds:(CGRect)containerViewBounds
{
    CGRect abacusViewbounds = [self getAbacusViewBounds:containerViewBounds];

    return CGRectMake(NUMBER_VIEW_ORIGIN_X_OFFSET,
                      abacusViewbounds.origin.y -
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height -
                      NUMBER_VIEW_OFFSET_FROM_ABACUS_VIEW,
                      NUMBER_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
}

+(CGRect) getAbacusValueViewBounds:(CGRect)containerViewBounds
{
    CGRect numberViewbounds = [self getNumberViewBounds:containerViewBounds];

    return CGRectMake(ABACUS_VALUE_VIEW_ORIGIN_X_OFFSET,
                      numberViewbounds.origin.y -
                      ABACUS_VALUE_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height -
                      ABACUS_VALUE_VIEW_OFFSET_FROM_NUMBER_VIEW,
                      ABACUS_VALUE_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      ABACUS_VALUE_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
}

+(CGRect) getCalculatorViewBounds:(CGRect)containerViewBounds
{
    CGRect abacusValueViewbounds = [self getAbacusValueViewBounds:containerViewBounds];
    
    return CGRectMake(CALCULATOR_VIEW_ORIGIN_X_OFFSET,
                      abacusValueViewbounds.origin.y -
                      CALCULATOR_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height -
                      CALCULATOR_VIEW_OFFSET_FROM_ABACUS_VALUE_VIEW,
                      CALCULATOR_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      CALCULATOR_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
    
}

+(CGRect)getRowViewBounds:(CGRect)abacusViewBounds
{
    return CGRectMake(abacusViewBounds.origin.x + ABACUS_VIEW_BORDER_SIZE,
                      abacusViewBounds.origin.y + ABACUS_VIEW_BORDER_SIZE + ((abacusViewBounds.size.height/7) * 2),
                      abacusViewBounds.size.width - 2*ABACUS_VIEW_BORDER_SIZE,
                      ROW_VIEW_HEIGHT);
}

+(CGFloat)getColumnViewWidth:(CGRect)abacusViewBounds
{
    return (abacusViewBounds.size.width-2*ABACUS_VIEW_BORDER_SIZE)/(NUM_OF_COLUMNS + 1);
}

+(CGFloat)getColumnViewGap:(CGRect)abacusViewBounds
{
    return [self getColumnViewWidth:abacusViewBounds]/(NUM_OF_COLUMNS);
}

+(CGFloat)getColumnViewHeight:(CGRect)abacusViewBounds
{
    return abacusViewBounds.size.height - 2*ABACUS_VIEW_BORDER_SIZE;
}

+(CGRect)getColumnViewBounds:(CGRect)abacusViewBounds forColumn:(NSInteger)columnIndex
{
    CGFloat columnViewWidth = [self getColumnViewWidth:abacusViewBounds];
    CGFloat columnViewGap = [self getColumnViewGap:abacusViewBounds];
    CGFloat columnnViewHeight = [self getColumnViewHeight:abacusViewBounds];
    
    CGFloat originX = (abacusViewBounds.size.width - ABACUS_VIEW_BORDER_SIZE) - columnIndex * columnViewWidth - columnIndex * columnViewGap;
    CGFloat originY = abacusViewBounds.origin.y + ABACUS_VIEW_BORDER_SIZE;
    return CGRectMake(originX,
                      originY,
                      columnViewWidth,
                      columnnViewHeight);
}

+(CGRect)getColumnBounds:(CGRect)columnViewBounds
{
    CGFloat columnWidth = COLUMN_WIDTH;
    CGFloat originX = columnViewBounds.origin.x + (columnViewBounds.size.width - columnWidth)/2;
    return CGRectMake(originX, columnViewBounds.origin.y, columnWidth, columnViewBounds.size.height);
}

+(CGSize)getBeadSize:(CGRect)columnViewBounds
{
    CGSize beadSize = { columnViewBounds.size.width * COLUMN_BEAD_WIDTH_RATIO,
                        columnViewBounds.size.width * COLUMN_BEAD_HEIGHT_RATIO};
    return beadSize;
}

+(CGRect) getBeadViewBounds:(CGRect)columnViewBounds forBead:(NSInteger)beadIndex
{
    CGSize BEAD_SIZE = { columnViewBounds.size.width * COLUMN_BEAD_WIDTH_RATIO,
                         columnViewBounds.size.width * COLUMN_BEAD_HEIGHT_RATIO};
    CGFloat beadOriginY;
    if(beadIndex == 5) {
        beadOriginY = 0 + BEAD_GAP;
    } else {
        beadOriginY = (columnViewBounds.size.height) - (BEADS_PER_COLUMN - beadIndex)*(BEAD_SIZE.height) -
        (BEADS_PER_COLUMN - beadIndex)*BEAD_GAP;
    }
    CGFloat beadOriginX = columnViewBounds.origin.x + (columnViewBounds.size.width - BEAD_SIZE.width)/2;
    CGRect beadViewBounds = CGRectMake(beadOriginX, beadOriginY, BEAD_SIZE.width, BEAD_SIZE.height);
    return beadViewBounds;
}

+(CGFloat)getDigitViewWidth:(CGRect)numberViewBounds
{
    return (numberViewBounds.size.width-2*ABACUS_VIEW_BORDER_SIZE)/(NUM_OF_COLUMNS + 1);
}

+(CGFloat)getDigitViewGap:(CGRect)numberViewBounds
{
    return [self getDigitViewWidth:numberViewBounds]/(NUM_OF_COLUMNS);
}

+(CGFloat)getDigitViewHeight:(CGRect)numberViewBounds
{
    return numberViewBounds.size.height;
}


+(CGRect)getDigitViewBounds:(CGRect)numberViewBounds forDigit:(NSInteger)digitIndex
{
    CGFloat digitViewWidth = [self getDigitViewWidth:numberViewBounds];
    CGFloat digitViewGap = [self getDigitViewGap:numberViewBounds];
    CGFloat digitViewHeight = [self getDigitViewHeight:numberViewBounds];
    
    CGFloat originX = (numberViewBounds.size.width - ABACUS_VIEW_BORDER_SIZE)
                        - digitIndex * digitViewWidth - digitIndex * digitViewGap;
    CGFloat originY = numberViewBounds.origin.y;
    return CGRectMake(originX,
                      originY,
                      digitViewWidth,
                      digitViewHeight);
}


+(CGRect)getDigitLabelBounds:(CGRect)digitViewBounds
{
    return CGRectMake(digitViewBounds.origin.x,
                      digitViewBounds.origin.y + digitViewBounds.size.height/2,
                      digitViewBounds.size.width,
                      digitViewBounds.size.height/2);
}

+(CGRect)getCalculatorDigitDisplayBounds:(CGRect)calculatorViewBounds
{
    return CGRectMake(calculatorViewBounds.origin.x, calculatorViewBounds.origin.y,
                      calculatorViewBounds.size.width, calculatorViewBounds.size.height*CALCULATOR_DIGIT_DISPLAY_HEIGHT_SCALE_FACTOR);
}

+(CGRect)getCalculatorDigitButtonBounds:(CGRect)calculatorViewBounds forRow:(NSInteger)row forColumn:(NSInteger)column
{
    CGRect calculatorDigitDisplayBounds = [self getCalculatorDigitDisplayBounds:calculatorViewBounds];

    CGFloat buttonWidth = calculatorViewBounds.size.width/CALCULATOR_DIGIT_BUTTONS_COLUMNS;
    CGFloat buttonHeight = (calculatorViewBounds.size.height - calculatorDigitDisplayBounds.size.height)
                            /CALCULATOR_DIGIT_BUTTONS_ROWS;
    
    
    return CGRectMake(calculatorDigitDisplayBounds.origin.x + (column - 1)*buttonWidth,
                      calculatorDigitDisplayBounds.origin.y + calculatorDigitDisplayBounds.size.height + (row -1)*buttonHeight,
                      buttonWidth,
                      buttonHeight);
}

@end
