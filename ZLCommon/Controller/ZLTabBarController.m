//
//  ZLTabBarController.m
//  ZLCommon
//
//  Created by 张璐 on 15/10/30.
//  Copyright © 2015年 张璐. All rights reserved.
//

#import "ZLTabBarController.h"
#import "ZLTabbar.h"
#import "ZLNavigationController.h"
#import "ZLFunctionOneViewController.h"
#import "ZLFuntionTwoViewController.h"
#import "ZLFuntionThreeViewContrller.h"
#import "ZLFuntionFourViewController.h"
#import "UIImage+ZLEffects.h"

@interface ZLTabBarController ()<ZLTabbarDelegate>
@property(nonatomic,strong)ZLTabbar * tab;
@end

@implementation ZLTabBarController


-(void)viewWillAppear:(BOOL)animated
{   [super viewWillAppear:animated];
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
        
    }
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加自定义tabbar
    self.tab = [[ZLTabbar alloc]init];
    self.tab.frame = self.tabBar.bounds;
    self.tab.delegate = self;
    UIImage * image = [UIImage imageWithView:self.tab];
    self.tab.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.tabBar addSubview:self.tab];
    
    [self setupVC];
    

}
//创建各功能控制器
-(void)setupVC
{
    ZLFunctionOneViewController * buyVC = [[ZLFunctionOneViewController alloc]init];
    buyVC.view.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.5];
    [self addChildVCWith:buyVC title: @"功能1" normalImage:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    ZLFuntionTwoViewController * fVC = [[ZLFuntionTwoViewController alloc]init];
    fVC.view.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5];
    [self addChildVCWith:fVC title: @"功能2" normalImage:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    ZLFuntionThreeViewContrller * messageVC = [[ZLFuntionThreeViewContrller alloc]init];
    messageVC.view.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.5];
    [self addChildVCWith:messageVC title: @"功能3" normalImage:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ZLFuntionFourViewController * lucyVC = [[ZLFuntionFourViewController alloc]init];
    lucyVC.view.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.5];
    [self addChildVCWith:lucyVC title: @"功能4" normalImage:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    

}
//将各功能控制器添加到tabbarVC中
-(void)addChildVCWith:(UIViewController *)childVC title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    childVC.title = title;
    [self.tab setupItemWithTitle:title normalImage:normalImage selectedImage:selectedImage];
    ZLNavigationController * navVC = [[ZLNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:navVC];
}

#pragma mark -
-(void)tabbarDidSlected:(ZLTabbar *)tabbar from:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
@end
