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

@interface AbacusViewController ()
@property (weak, nonatomic) IBOutlet ContainerView *containterView;
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
    NSLog(@"viewDidLoad");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beadValueChanged:)
                                                 name:@"BeadValueChangedNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)beadValueChanged:(NSNotification *) notification
{
    //NSLog(@"beadValueChanged");

    BeadView *beadView = (BeadView*)[notification object];
    ColumnView *columnView = (ColumnView*)[beadView superview];
    
    Column *column = [[self abacus] getColumn:[beadView placeValue]];
    for(BeadView *beadView in [columnView subviews]) {
        Bead *bead = [column getBeadAtIndex:[beadView beadIndex]];
        if([beadView isSet]) {
            bead.set = YES;
        } else if([beadView isReset]){
            bead.set = NO;
        }
    }
    
    NSLog(@"%ld", [[self abacus] value]);
    
    
}

@end
