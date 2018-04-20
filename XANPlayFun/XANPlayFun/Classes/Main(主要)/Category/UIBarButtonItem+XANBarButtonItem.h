//
//  UIBarButtonItem+XANBarButtonItem.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XANBarButtonItem)

/**
 快速创建一个文字的item

 @param name item文字
 @param target <#target description#>
 @param action <#action description#>
 @return <#return value description#>
 */
+(UIBarButtonItem *)itemWithName:(NSString *)name target:(id)target action:(SEL)action;

/**
 快速创建一个图片的item

 @param normalImage 常态图片名字
 @param highImage 高亮图片名字
 @param target <#target description#>
 @param action <#action description#>
 @return <#return value description#>
 */
+(UIBarButtonItem *)itemWithNormalImage:(NSString *)normalImage highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
