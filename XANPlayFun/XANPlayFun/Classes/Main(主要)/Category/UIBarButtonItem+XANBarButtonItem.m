//
//  UIBarButtonItem+XANBarButtonItem.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "UIBarButtonItem+XANBarButtonItem.h"

@implementation UIBarButtonItem (XANBarButtonItem)

+(UIBarButtonItem *)itemWithName:(NSString *)name target:(id)target action:(SEL)action{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateHighlighted];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}

+(UIBarButtonItem *)itemWithNormalImage:(NSString *)normalImage highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}
@end
