//
//  UIImage+ZLEffects.h
//  LifeBox
//
//  Created by 张璐 on 15/9/11.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZLEffects)

- (UIImage *)zl_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
+ (UIImage *)imageWithView:(UIView *)view;
@end
