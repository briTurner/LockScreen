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

int sizeConst = 20;

@implementation LSImageFactory

+ (UIImage *)imageForPasswordCharacter:(LSPasswordCharacter *)character {
    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float multiplier = 0;
    switch ([character sizeOrRandom]) {
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
            break;
        }
    }
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    CGPoint center = CGPointMake(50, 50);
    CGFloat offset = sizeConst * multiplier;
    switch ([character shapeOrRandom]) {
        case LSPasswordCharacterAttributeShapeCircle:
            [path addArcWithCenter:CGPointMake(50, 50) radius:offset startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            break;
        case LSPasswordCharacterAttributeShapeTriangle: {
            [path moveToPoint:CGPointMake(center.x, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
            [path addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
            break;
        }
        case LSPasswordCharacterAttributeShapeSquare:
            [path moveToPoint:CGPointMake(center.x - offset, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y + offset)];
            [path addLineToPoint:CGPointMake(center.x + offset, center.y - offset)];
            [path addLineToPoint:CGPointMake(center.x - offset, center.y - offset)];
            break;
        default:
            break;
    }
    [path closePath];
    
    switch ([character colorOrRandom]) {
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
