//
//  UIImage+XANImage.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/20.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "UIImage+XANImage.h"

@implementation UIImage (XANImage)

+(UIImage *)imageOriginalWithName:(NSString *)imageName{
    UIImage *image=[UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
