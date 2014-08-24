//
//  AMPViewController.m
//  AMPActivityIndicator
//
//  Created by Alejandro Martinez on 08/24/2014.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import "AMPViewController.h"
#import "AMPActivityIndicator.h"
#import "UIColor+AMPAdditions.h"

@interface AMPViewController ()
@property (nonatomic, strong) IBOutlet AMPActivityIndicator *spinner;
@end

@implementation AMPViewController

- (IBAction)changeColor:(id)sender
{
    [self.spinner setBarColor:[UIColor randomColor]];
}

- (IBAction)changeWidth:(id)sender
{
    [self.spinner setBarWidth:[(UISlider *)sender value]];
}

- (IBAction)changeHeight:(id)sender
{
    [self.spinner setBarHeight:[(UISlider *)sender value]];
}

- (IBAction)changeAperture:(id)sender
{
    [self.spinner setAperture:[(UISlider *)sender value]];
}

- (IBAction)startAction:(id)sender {
    [self.spinner startAnimating];
}

- (IBAction)stopAction:(id)sender {
    [self.spinner stopAnimating];
}

@end
