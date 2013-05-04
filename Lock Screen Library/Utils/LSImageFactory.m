//
//  LSImageFactory.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSImageFactory.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import "LSPasswordCharacter.h"

#define shadowOffset 5
int sizeConst = 20;

@implementation LSImageFactory

+ (UIImage *)imageForPasswordCharacter:(LSPasswordCharacter *)character {
    UIColor *greenColor = [UIColor colorWithRed:0.376 green:0.812 blue:0.169 alpha:1.000];
    
    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSArray *multipliers = @[@0, @.55, @1.2, @2];
    float sizeMultiplier = [[multipliers objectAtIndex:[character size]] floatValue];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    UIBezierPath *outlines = [[UIBezierPath alloc] init];
    UIBezierPath *outlinesShadow = [[UIBezierPath alloc] init];
    
    CGPoint center = CGPointMake(50, 50);
    CGFloat offset = sizeConst * sizeMultiplier;
    switch ([character shape]) {
        case LSPasswordCharacterShapeCircle:
            [path addArcWithCenter:CGPointMake(50, 50) radius:offset startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            for (NSNumber *multiplier in multipliers) {
                if ([multiplier floatValue] == sizeMultiplier)
                    continue;
                offset = sizeConst * [multiplier floatValue];
                [outlines moveToPoint:CGPointMake(50 + offset, 50)];
                [outlines addArcWithCenter:CGPointMake(50, 50) radius:offset startAngle:0 endAngle:M_PI * 2 clockwise:YES];
                [outlines closePath];
                
                if ([multiplier floatValue] > sizeMultiplier) {
                [outlinesShadow moveToPoint:CGPointMake(50 + offset + shadowOffset, 50 + shadowOffset)];
                [outlinesShadow addArcWithCenter:CGPointMake(50 + shadowOffset, 50 + shadowOffset) radius:offset startAngle:0 endAngle:M_PI * 2 clockwise:YES];
                [outlinesShadow closePath];
                }
            }
            break;
        case LSPasswordCharacterShapeTriangle: {
            [path moveToPoint:CGPointMake(center.x, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
            [path addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
            
            for (NSNumber *multiplier in multipliers) {
                if ([multiplier floatValue] == sizeMultiplier)
                    continue;
                offset = sizeConst * [multiplier floatValue];
                [outlines moveToPoint:CGPointMake(center.x, center.y + offset)];
                [outlines addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
                [outlines addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
                [outlines closePath];
                
                if ([multiplier floatValue] > sizeMultiplier) {
                    [outlinesShadow moveToPoint:CGPointMake(center.x + shadowOffset, center.y + offset + shadowOffset)];
                    [outlinesShadow addLineToPoint:CGPointMake(center.x + offset + shadowOffset, center.y - offset + shadowOffset)];
                    [outlinesShadow addLineToPoint:CGPointMake(center.x - offset + shadowOffset, center.y - offset + shadowOffset)];
                    [outlinesShadow closePath];
                }
            }
            break;
        }
        case LSPasswordCharacterShapeSquare:
            [path moveToPoint:CGPointMake(center.x - offset, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
            [path addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
            
            for (NSNumber *multiplier in multipliers) {
                if ([multiplier floatValue] == sizeMultiplier)
                    continue;
                offset = sizeConst * [multiplier floatValue];
                [outlines moveToPoint:CGPointMake(center.x - offset, center.y + offset)];
                [outlines addLineToPoint:CGPointMake(center.x + offset, center.y + offset)];

                [outlines addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
                [outlines addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
                [outlines closePath];
                
                if ([multiplier floatValue] > sizeMultiplier) {
                    [outlinesShadow moveToPoint:CGPointMake(center.x - offset + shadowOffset, center.y + offset + shadowOffset)];
                    [outlinesShadow addLineToPoint:CGPointMake(center.x + offset + shadowOffset, center.y + offset + shadowOffset)];
                    
                    [outlinesShadow addLineToPoint:CGPointMake(center.x + offset + shadowOffset, center.y - offset + shadowOffset)];
                    [outlinesShadow addLineToPoint:CGPointMake(center.x - offset + shadowOffset, center.y - offset + shadowOffset)];
                    [outlinesShadow closePath];
                }
            }
            break;
        default:
            break;
    }
    [path closePath];
    
    switch ([character color]) {
        case LSPasswordCharacterColorBlue:
            CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
            break;
        case LSPasswordCharacterColorRed:
            CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
            break;
        case LSPasswordCharacterColorGreen:
            CGContextSetStrokeColorWithColor(context, [greenColor CGColor]);
            CGContextSetFillColorWithColor(context, [greenColor CGColor]);
            break;
        default:
            break;
    }
    
    [path stroke];
    [path fill];

    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGFloat dashArray[] = {5,4};
    CGContextSetLineDash(context, 3, dashArray, 2);
    [outlines stroke];
    
    CGContextSetStrokeColorWithColor(context, [[UIColor grayColor] CGColor]);
    [outlinesShadow stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
