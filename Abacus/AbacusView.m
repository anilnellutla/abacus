//
//  AbacusView.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/18/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AbacusView.h"
#import "ColumnView.h"
#import "RowView.h"
#import "Column.h"

@implementation AbacusView

static const NSUInteger NUM_OF_COLUMNS = 10;

-(void)setAbacus:(Abacus *)abacus
{
    _abacus = abacus;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundRect addClip];
    
    [[UIColor whiteColor] setFill];
    
    //UIRectFill(self.bounds);
    [backgroundRect fill];
    
    [self drawAbacus:rect];
    
}

-(void)drawAbacus:(CGRect)rect
{    
    UIBezierPath *abacusRect = [UIBezierPath bezierPathWithRect:rect];
    
    [[UIColor whiteColor] setFill];
    [abacusRect fill];
    
    [[UIColor blueColor] setStroke];
    [abacusRect stroke];
    
    
    [self drawRow:rect];

    [self drawColumns:rect];    
    
}

-(void)drawColumns:(CGRect)rect
{
    CGFloat columnWidth = rect.size.width/(NUM_OF_COLUMNS + 1);
    CGFloat columnGap = columnWidth / (NUM_OF_COLUMNS);
    CGFloat pathX = rect.size.width - columnWidth - columnGap;
    for(int i = 0; i < NUM_OF_COLUMNS; i++) {
        CGRect columnFrame = CGRectMake(pathX, rect.origin.y, columnWidth, rect.size.height);
        ColumnView *columnView = [[ColumnView alloc] initWithFrame:columnFrame];
        columnView.columnIndex = i + 1;
        
        [self addSubview:columnView];
        
        pathX = pathX - columnWidth - columnGap;
    }
}

-(void)drawRow:(CGRect)rect
{
    CGFloat columnHeight = rect.size.height/7;
    CGRect rowFrame = CGRectMake(rect.origin.x, rect.origin.y + (columnHeight * 2), rect.size.width, 1);
    RowView *rowView = [[RowView alloc] initWithFrame:rowFrame];
    [self addSubview:rowView];
}

#pragma mark - Initialization

- (void)setUp
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

@end
