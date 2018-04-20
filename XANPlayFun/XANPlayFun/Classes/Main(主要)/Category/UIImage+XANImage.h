//
//  UIImage+XANImage.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XANImage)

/**
 返回一张没有被渲染的图片

 @param imageName 图片的名称
 @return 返回一张没有被渲染的图片
 */
+(UIImage *)imageOriginalWithName:(NSString *)imageName;

@end
