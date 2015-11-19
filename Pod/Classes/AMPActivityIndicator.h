//
//  AMPActivityIndicator.h
//  AMPActivityIndicator Example
//
//  Created by Alejandro Martinez on 11/08/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPActivityIndicator : UIView

@property (nonatomic) UIColor *barColor;
@property (nonatomic) CGFloat barWidth;
@property (nonatomic) CGFloat barHeight;
@property (nonatomic) CGFloat aperture;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

- (void)setProgress:(CGFloat)progress;

@end
