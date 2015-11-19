//
//  AMPActivityIndicator.m
//  AMPActivityIndicator Example
//
//  Created by Alejandro Martinez on 11/08/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPActivityIndicator.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat AMPActivityIndicatorDefaultSpeed = 1.0f;
static NSString * const AMPActivityIndicatorAnimationKey = @"AMPActivityIndicatorAnimationKey";

@interface AMPActivityIndicator ()

@property (nonatomic) CGFloat hudSize;
@property (nonatomic) NSInteger numberOfBars;

@property (nonatomic) CALayer *marker;
@property (nonatomic) CAReplicatorLayer *spinnerReplicator;
@property (nonatomic) CABasicAnimation *fadeAnimation;

@end

@implementation AMPActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self setBackgroundColor:[UIColor clearColor]];
    
    _barColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    _aperture = 35.0f;
    _numberOfBars = 12.0f;
    _barWidth = 8.0f;
    _barHeight = 25.0f;
    
    [self createLayers];
    [self updateLayers];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.hudSize = CGRectGetWidth(self.bounds);
    [self updateLayers];
}

- (void)updateLayers
{
    // Update marker
    [self.marker setBounds:CGRectMake(0.0f, 0.0f, _barWidth, _barHeight)]; // size of the rectangle marker
    [self.marker setCornerRadius:_barWidth * 0.5];
    [self.marker setBackgroundColor:[_barColor CGColor]];
    [self.marker setPosition:CGPointMake(self.hudSize * 0.5f, self.hudSize * 0.5f + _aperture)];
    
    // Update replicaitons
    [self.spinnerReplicator setBounds:CGRectMake(0.0f, 0.0f, self.hudSize, self.hudSize)];
    [self.spinnerReplicator setCornerRadius:10.0f];
    [self.spinnerReplicator setPosition:CGPointMake(CGRectGetMidX(self.bounds),
                                                    CGRectGetMidY(self.bounds))];
    
    CGFloat angle = (2.0f * M_PI) / (self.numberOfBars);
    CATransform3D instanceRotation = CATransform3DMakeRotation(angle, 0.0f, 0.0f, 1.0f);
    [self.spinnerReplicator setInstanceCount:self.numberOfBars];
    [self.spinnerReplicator setInstanceTransform:instanceRotation];
}

- (void)createLayers {
    [self.spinnerReplicator addSublayer:self.marker];
    [self.layer addSublayer:self.spinnerReplicator];
    
    [self.marker setOpacity:0.0f]; // will be visible thanks to the animation
}

#pragma mark Public methods

- (void)startAnimating
{
    [self.marker setOpacity:0.0f];
    [self.spinnerReplicator setInstanceCount:self.numberOfBars];
    
    [self.fadeAnimation setDuration:AMPActivityIndicatorDefaultSpeed];
    CGFloat markerAnimationDuration = AMPActivityIndicatorDefaultSpeed / self.numberOfBars;
    [self.spinnerReplicator setInstanceDelay:markerAnimationDuration];
    [self.marker addAnimation:self.fadeAnimation forKey:AMPActivityIndicatorAnimationKey];
}

- (void)stopAnimating
{
    [self.marker removeAnimationForKey:AMPActivityIndicatorAnimationKey];
    [self.marker setOpacity:0.0f];
}

- (BOOL)isAnimating
{
    return [self.marker animationForKey:AMPActivityIndicatorAnimationKey] != nil;
}

- (void)setProgress:(CGFloat)progress
{
    [self.marker setOpacity:1.0f];
    [self.spinnerReplicator setInstanceCount:self.numberOfBars * progress];
}

#pragma mark - Getters

- (CALayer *)marker {
    if (!_marker) {
        _marker = [CALayer layer];
    }
    return _marker;
}

- (CAReplicatorLayer *)spinnerReplicator {
    if (!_spinnerReplicator) {
        _spinnerReplicator = [CAReplicatorLayer layer];
    }
    return _spinnerReplicator;
}

- (CABasicAnimation *)fadeAnimation {
    if (!_fadeAnimation) {
        _fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    }
    
    [_fadeAnimation setFromValue:[NSNumber numberWithFloat:1.0f]];
    [_fadeAnimation setToValue:[NSNumber numberWithFloat:0.0f]];
    [_fadeAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [_fadeAnimation setRepeatCount:HUGE_VALF];
    
    return _fadeAnimation;
}

#pragma mark - Setters

- (void)setBarColor:(UIColor *)barColor {
    _barColor = barColor;
    [self updateLayers];
}

- (void)setBarWidth:(CGFloat)barWidth {
    _barWidth = barWidth;
    [self updateLayers];
}

- (void)setBarHeight:(CGFloat)barHeight {
    _barHeight = barHeight;
    [self updateLayers];
}

- (void)setAperture:(CGFloat)aperture {
    _aperture = aperture;
    [self updateLayers];
}

@end
