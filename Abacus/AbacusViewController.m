//
//  AbacusViewController.m
//  Abacus
//
//  Created by Anil K Nellutla on 3/17/14.
//  Copyright (c) 2014 Anil K Nellutla. All rights reserved.
//

#import "AbacusViewController.h"
#import "ContainerView.h"
#import "ColumnView.h"
#import "BeadView.h"
#import "Abacus.h"
#import "DigitView.h"
#import "NumberView.h"
#import "UIConfig.h"
#import "AbacusValueView.h"

@interface AbacusViewController ()
@property (weak, nonatomic) IBOutlet ContainerView *containterView;
@property (weak, nonatomic) IBOutlet AbacusValueView *abacusValueView;

@property (strong, nonatomic) Abacus *abacus;
@end

@implementation AbacusViewController

- (Abacus*)abacus
{
    if(!_abacus) {
        _abacus = [[Abacus alloc] initWithNumberOfColumns:10 beadsPerColumn:5];
    }
    return _abacus;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beadMoved:)
                                                 name:@"BeadMovedNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)beadMoved:(NSNotification *) notification
{
    //NSLog(@"beadValueChanged");

    BeadView *notifiedBeadView = (BeadView*)[notification object];
    ColumnView *columnView = (ColumnView*)[notifiedBeadView superview];
    
    Column *column = [[self abacus] getColumn:[notifiedBeadView placeValue]];
    for(BeadView *beadView in [columnView subviews]) {
        Bead *bead = [column getBeadAtIndex:[beadView beadIndex]];
        if([beadView isSet]) {
            [bead set:YES];
        } else if([beadView isReset]){
            [bead set:NO];
        }
    }

    NumberView *numberView = [[[self containterView] subviews] firstObject];
    
    NSArray *digitviews = [numberView subviews];
    for(DigitView *digitView in digitviews) {
        if([digitView placeValue] == [notifiedBeadView placeValue]) {
            [digitView setDigit:[column value]];
            break;
        }
    }
    
    NSLog(@"%ld", [[self abacus] value]);
    [[self abacusValueView] setValue:[[self abacus] value]];
    
    
    
}

@end
