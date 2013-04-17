//
//  LSImageFactory.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSImageFactory.h"
#import <CoreGraphics/CoreGraphics.h>
#import "LSPasswordCharacter.h"

@implementation LSImageFactory

+ (UIImage *)imageForPasswordCharacter:(LSPasswordCharacter *)character {
    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float multiplier = 0;
    switch ([character size]) {
        case LSPasswordCharacterAttributeSizeLarge:
            multiplier = 2;
            break;
        case LSPasswordCharacterAttributeSizeMedium:
            multiplier = 1;
            break;
        case LSPasswordCharacterAttributeSizeSmall:
            multiplier = .5;
            break;
        default: {
            multiplier = .5;
            break;
        }
    }

    UIBezierPath *path = [[UIBezierPath alloc] init];
    switch ([character shape]) {
        case LSPasswordCharacterAttributeShapeCircle:
            [path addArcWithCenter:CGPointMake(50, 50) radius:20 * multiplier startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            break;
        case LSPasswordCharacterAttributeShapeTriangle:
            break;
        case LSPasswordCharacterAttributeShapeSquare:
            break;
        default:
            [path addArcWithCenter:CGPointMake(50, 50) radius:20 * multiplier startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            break;
    }
    [path closePath];
    
    switch ([character color]) {
        case LSPasswordCharacterAttributeColorBlue:
            CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
            break;
        case LSPasswordCharacterAttributeColorRed:
            CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
            break;
        case LSPasswordCharacterAttributeColorGreen:
            CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
            break;
        default:
            CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
            break;
    }
    
    [path stroke];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
