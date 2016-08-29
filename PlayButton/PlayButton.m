//
//  PlayButton.m
//  PlayButton
//
//  Created by Chao on 16/8/29.
//  Copyright © 2016年 Chao. All rights reserved.
//

#import "PlayButton.h"

#define Padding self.frame.size.width / 5
#define WIDTH   self.frame.size.width
#define HEIGHT  self.frame.size.height

@interface PlayButton ()

@property (nonatomic, strong) CAShapeLayer *leftShape;
@property (nonatomic, strong) CAShapeLayer *rightShape;

@end

@implementation PlayButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatLayers];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapReg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pathAnimation)];
        [self addGestureRecognizer:tapReg];
    }
    
    return self;
}

- (void)pathAnimation{
    
    [_leftShape removeAllAnimations];
    [_rightShape removeAllAnimations];
    
    
    CABasicAnimation *leftanimation = [CABasicAnimation animationWithKeyPath:@"path"];
    leftanimation.removedOnCompletion = NO;
    leftanimation.duration = 0.3;
    leftanimation.fromValue = (__bridge id)(self.isSelect ? [self getSelectLeftLayerBezierPath].CGPath : [self getNormalLeftLayerBezierPath].CGPath);
    leftanimation.toValue = (__bridge id)(self.isSelect ? [self getNormalLeftLayerBezierPath].CGPath : [self getSelectLeftLayerBezierPath].CGPath);
    _leftShape.path = self.isSelect ? [self getNormalLeftLayerBezierPath].CGPath : [self getSelectLeftLayerBezierPath].CGPath;
    [_leftShape addAnimation:leftanimation forKey:@"leftAnimationPath"];

    
    CABasicAnimation *rightAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    rightAnimation.fromValue = (__bridge id)(self.isSelect ? [self getSelectRightLayerBezierPath].CGPath : [self getNormalRightLayerBezierPath].CGPath);
    rightAnimation.toValue = (__bridge id)(self.isSelect ? [self getNormalRightLayerBezierPath].CGPath : [self getSelectRightLayerBezierPath].CGPath);
    rightAnimation.duration = 0.3;
    _rightShape.path = self.isSelect ? [self getNormalRightLayerBezierPath].CGPath : [self getSelectRightLayerBezierPath].CGPath;
    [_rightShape addAnimation:rightAnimation forKey:@"rightAnimationPath"];
    
    self.isSelect = !self.isSelect;
}

- (void)creatLayers{
    
    _leftShape = [CAShapeLayer layer];
    _leftShape.path = [self getNormalLeftLayerBezierPath].CGPath;
    [self.layer addSublayer:_leftShape];
    
    _rightShape = [CAShapeLayer layer];
    _rightShape.path = [self getNormalRightLayerBezierPath].CGPath;
    [self.layer addSublayer:_rightShape];
}

- (UIBezierPath *)getNormalLeftLayerBezierPath{
    
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, (self.frame.size.width - Padding) / 2, self.frame.size.height)];
    [[UIColor greenColor] setFill];
    [rectangle2Path fill];
    [[UIColor greenColor] setStroke];
    rectangle2Path.lineWidth = 1;
    [rectangle2Path stroke];
    
    return rectangle2Path;
    
}

- (UIBezierPath *)getNormalRightLayerBezierPath{
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake((self.frame.size.width - Padding) / 2 + Padding, 0, (self.frame.size.width - Padding) / 2, self.frame.size.height)];
    [[UIColor whiteColor] setFill];
    [rectanglePath fill];
    [[UIColor blackColor] setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    return rectanglePath;
}

- (UIBezierPath *)getSelectLeftLayerBezierPath{
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(0, 0)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH / 2, HEIGHT / 4)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH / 2, HEIGHT * 3 / 4)];
    [bezierPath addLineToPoint: CGPointMake(0, HEIGHT)];
    [bezierPath addLineToPoint: CGPointMake(0, 0)];
    [bezierPath closePath];
    [[UIColor grayColor] setFill];
    [bezierPath fill];
    [[UIColor blackColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    return bezierPath;
}

- (UIBezierPath *)getSelectRightLayerBezierPath{
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(WIDTH / 2, HEIGHT / 4)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH, HEIGHT / 2)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH, HEIGHT / 2)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH / 2, HEIGHT * 3 / 4)];
    [bezierPath addLineToPoint: CGPointMake(WIDTH / 2, HEIGHT / 4)];
    [bezierPath closePath];
    [[UIColor grayColor] setFill];
    [bezierPath fill];
    [[UIColor blackColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    return bezierPath;
}

@end
