//
//  ZLTabbar.h
//  ZLCommon
//
//  Created by 张璐 on 15/10/30.
//  Copyright © 2015年 张璐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLTabbar;
@protocol ZLTabbarDelegate <NSObject>

-(void)tabbarDidSlected:(ZLTabbar *)tabbar from:(NSInteger)from to:(NSInteger)to;

@end
@interface ZLTabbar : UIView
-(void)setupItemWithTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;
@property(nonatomic,weak)id<ZLTabbarDelegate> delegate;
@end

