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

+(CGRect) getNumberViewBounds:(CGRect)containerViewBounds
{
    return CGRectMake(NUMBER_VIEW_ORIGIN_X_OFFSET,
                      NUMBER_VIEW_ORIGIN_Y_OFFSET,
                      NUMBER_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);

}

+(CGRect) getAbacusViewBounds:(CGRect)containerViewBounds
{
    return CGRectMake(ABACUS_VIEW_ORIGIN_X_OFFSET,
                      NUMBER_VIEW_ORIGIN_Y_OFFSET +
                      NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height +
                      ABACUS_VIEW_ORIGIN_Y_OFFSET,
                      ABACUS_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      containerViewBounds.size.height - NUMBER_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
}

+(CGRect)getRowViewBounds:(CGRect)abacusViewBounds
{
    return CGRectMake(abacusViewBounds.origin.x,
                      abacusViewBounds.origin.y + ((abacusViewBounds.size.height/7) * 2),
                      abacusViewBounds.size.width,
                      3);
}

+(CGFloat)getColumnViewWidth:(CGRect)abacusViewBounds
{
    return abacusViewBounds.size.width/(NUM_OF_COLUMNS + 1);
}

+(CGFloat)getColumnViewGap:(CGRect)abacusViewBounds
{
    return [self getColumnViewWidth:abacusViewBounds]/(NUM_OF_COLUMNS);
}

+(CGFloat)getColumnViewHeight:(CGRect)abacusViewBounds
{
    return abacusViewBounds.size.height;
}

+(CGRect)getColumnViewBounds:(CGRect)abacusViewBounds forColumn:(NSInteger)columnIndex
{
    CGFloat columnViewWidth = [self getColumnViewWidth:abacusViewBounds];
    CGFloat columnViewGap = [self getColumnViewGap:abacusViewBounds];
    CGFloat columnnViewHeight = [self getColumnViewHeight:abacusViewBounds];
    
    CGFloat originX = abacusViewBounds.size.width - columnIndex * columnViewWidth - columnIndex * columnViewGap;
    CGFloat originY = abacusViewBounds.origin.y;
    return CGRectMake(originX,
                      originY,
                      columnViewWidth,
                      columnnViewHeight);
}

+(CGRect)getColumnBounds:(CGRect)columnViewBounds
{
    CGFloat columnWidth = 2;
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
    return numberViewBounds.size.width/(NUM_OF_COLUMNS + 1);
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
    
    CGFloat originX = numberViewBounds.size.width - digitIndex * digitViewWidth - digitIndex * digitViewGap;
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

+(CGRect)getAbacusValueLabelBounds:(CGRect)containerViewBounds
{
    return CGRectMake(ABACUS_VALUE_VIEW_ORIGIN_X_OFFSET,
                      containerViewBounds.origin.y - ABACUS_VALUE_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height,
                      ABACUS_VALUE_VIEW_WIDTH_SCALE_FACTOR * containerViewBounds.size.width,
                      ABACUS_VALUE_VIEW_HEIGHT_SCALE_FACTOR * containerViewBounds.size.height);
    
    
}



@end
