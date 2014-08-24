//
//  UIColor+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AMPAdditions)

/**
 * Returns an UIColor with random RGB values.
 */
+ (UIColor *)randomColor;

/**
 * Returns an UIColor created from the Hexadecimal value.
 */
+ (UIColor *)colorWithHex:(UInt32)hex;

/**
 * Creates an UIColor with RGB. No need to /255.0!
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue Alpha:(CGFloat)alpha;


@end
