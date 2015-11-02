//
//  ZLTabbarButton.m
//  ZLCommon
//
//  Created by 张璐 on 15/11/2.
//  Copyright © 2015年 张璐. All rights reserved.
//

#import "ZLTabbarButton.h"
#define imageHeight

@implementation ZLTabbarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
    }
    return self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.4;
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * 0.6;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
