//
//  ZLTabbar.m
//  ZLCommon
//
//  Created by 张璐 on 15/10/30.
//  Copyright © 2015年 张璐. All rights reserved.
//

#import "ZLTabbar.h"
#import "ZLTabbarButton.h"

@interface ZLTabbar ()

//@property(nonatomic,strong)UIImageView * bgView;
@property(nonatomic,strong)UIButton * selectedBtn;
@end
@implementation ZLTabbar


-(void)setupItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    
        ZLTabbarButton * btn = [[ZLTabbarButton alloc]init];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setImage:[[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [btn setImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
       [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
       btn.tag = self.subviews.count;
    if (btn.tag == 0) {
        [self btnClick:btn];
    }
        [self addSubview:btn];

    
}

-(void)btnClick:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabbarDidSlected:from:to:)]) {
        
        [self.delegate tabbarDidSlected:self from:self.selectedBtn.tag to:btn.tag];
    }
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //self.bgView.frame = self.bounds;
    CGFloat btnW = self.bounds.size.width/self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnY = 0;
    
    for (int i = 0; i<self.subviews.count; i++) {
        UIButton * btn = self.subviews[i];
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}


@end

