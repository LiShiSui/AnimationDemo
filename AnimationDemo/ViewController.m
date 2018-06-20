//
//  ViewController.m
//  AnimationDemo
//
//  Created by 李天宝 on 2018/1/23.
//  Copyright © 2018年 李天宝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self huxi];
//    [self rotation];
//    [self keyFrameAnimation];
//    [self layerModel];
    [self replicatorlayer];
}
- (void)replicatorlayer{
    UIView * tView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    tView.backgroundColor = [UIColor redColor];
    tView.layer.cornerRadius = 10;
    
    CABasicAnimation * transX = [CABasicAnimation animation];
    transX.keyPath = @"transform.scale";
    transX.toValue = @5;
    transX.fromValue = @1;
    transX.duration = 1;
    transX.repeatCount = HUGE;
    transX.fillMode = kCAFillModeBoth;
    transX.removedOnCompletion = YES;
    transX.autoreverses = YES;
    [tView.layer addAnimation:transX forKey:@"12"];
    
    
//    //例二：心跳效果
//    CABasicAnimation * ba = [CABasicAnimation animation];
//    ba.keyPath = @"transform.scale";
//    ba.toValue = @0;
//    ba.duration = 0.6;
//    ba.repeatCount = MAXFLOAT;
//    ba.autoreverses = YES;
//    [self.imageView.layer addAnimation:ba forKey:nil];

    
    
    CAReplicatorLayer * replicatorlayer = [[CAReplicatorLayer alloc] init];
    replicatorlayer.instanceCount = 3;
//    replicatorlayer.instanceDelay = 0.3;
    [replicatorlayer addSublayer:tView.layer];
    
    [self.view.layer addSublayer:replicatorlayer];
}
- (void)layerModel{
    
//    CALayer * blueLayer = [[CALayer alloc] init];
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    blueLayer.frame = CGRectMake(0, 0, 100, 100);
//    [_layerView.layer addSublayer:blueLayer];
    
    UIImage * image = [UIImage imageNamed:@"7.jpg"];
//    _layerView.contentMode = UIViewContentModeScaleToFill;
//    _layerView.layer.contentsGravity = kCAGravityResize;
//    _layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    [self addSpriteImage:image contentRect:CGRectMake(0, 0, .1, .1)];
//    [self addSpriteImage:image contentRect:CGRectMake(.5, 0, .5, .5)];
//    [self addSpriteImage:image contentRect:CGRectMake(0, .5, .5, .5)];
//    [self addSpriteImage:image contentRect:CGRectMake(.5, .5, .5, .5)];
    
}
- (void)addSpriteImage:(UIImage *)image contentRect:(CGRect)rect{
    self.view.layer.contents = (__bridge id)image.CGImage;
//    scale contents to fit
    _layerView.layer.contentsGravity = kCAGravityResize;
    
    // set contentsRect
    _layerView.layer.contentsRect = rect;
}
- (void)huxi{
    CABasicAnimation * animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"opacity";
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 5;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [btn.layer addAnimation:animation forKey:@"123"];
    
    
}
- (void)rotation{
    btn.layer.anchorPoint = CGPointMake(0, 0);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @1;
    animation.toValue = @-1;
    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.fillMode = kCAFillModeForwards;
    
    [btn.layer addAnimation:animation forKey:@"456"];
    
}
- (void)keyFrameAnimation{
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue * value2 = [NSValue valueWithCGPoint:CGPointMake(300, 50)];
    NSValue * value3 = [NSValue valueWithCGPoint:CGPointMake(300, 600)];
    NSValue * value4 = [NSValue valueWithCGPoint:CGPointMake(50, 600)];
    NSValue * value5 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    animation.values = @[value1,value2,value3,value4,value5];
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 5;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [btn.layer addAnimation:animation forKey:@"333"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
