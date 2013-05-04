//
//  LSDropZoneView.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSDropZoneView.h"
#import "LSPasswordCharacter.h"

const int kMinSizeOfChar = 50;
const int kMaxChars = 12;


@interface LSDropZoneView () {
    NSMutableArray *_characters;
    NSMutableArray *_characterViews;
}


@end

@implementation LSDropZoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _characters = [[NSMutableArray alloc] init];
    _characterViews = [[NSMutableArray alloc] init];
}

- (void)layoutSubviews {
    float width = [self frame].size.width;
    int maxCharactersPerRow =  floor(width / kMinSizeOfChar);
    
    if ([_characterViews count]) {
        int numberOfRows = ceil([_characterViews count] / (float)maxCharactersPerRow);
        int charWidth = MAX(MIN(width / [_characterViews count], 100), kMinSizeOfChar);
        int index = 0;
        for (int y = 0; y < numberOfRows; y++) {
            for (int x = 0; x < maxCharactersPerRow; x++) {
                if (index >= [_characterViews count])
                    break;
                UIImageView *characterImageView = [_characterViews objectAtIndex:index];
                [UIView animateWithDuration:.3 animations:^{
                    [characterImageView setFrame:CGRectMake(charWidth * x, charWidth * y, charWidth, charWidth)];
                }];
                index++;
            }
        }
    }
}

- (BOOL)addCharacter:(LSPasswordCharacter *)character fromRect:(CGRect)rect {
    if ([_characters count] < kMaxChars) {
        [_characters addObject:character];
        UIImageView *characterImageView = [[UIImageView alloc] initWithImage:[character imageForPasswordCharacter]];
        [characterImageView setFrame:rect];
        [_characterViews addObject:characterImageView];
        [self addSubview:characterImageView];
        return YES;
    } else {
        return NO;
    }
}

- (void)removeLastCharacter {
    UIImageView *imageView = [_characterViews lastObject];
    if (imageView) {
        [_characterViews removeLastObject];
        [_characters removeLastObject];
        [UIView animateWithDuration:.5 animations:^{
            [imageView setFrame:CGRectMake(160, 480, 50, 50)];
            [imageView setAlpha:0];
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    }
}

- (void)removeAllCharacters {
    [_characters removeAllObjects];
    for (UIImageView *imageView in _characterViews) {
        [imageView removeFromSuperview];
    }
    [_characterViews removeAllObjects];
}

@end
