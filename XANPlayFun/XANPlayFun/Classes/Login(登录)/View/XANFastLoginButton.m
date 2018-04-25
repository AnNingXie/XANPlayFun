//
//  XANFastLoginButton.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANFastLoginButton.h"

@implementation XANFastLoginButton

#define buttonW self.frame.size.width
#define buttonH self.frame.size.height
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageY=0;
    CGFloat imageX=buttonW*0.2;
    CGFloat imageH=buttonH*0.6;
    return CGRectMake(imageX, imageY, imageH, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat lableY=buttonH*0.6;
    CGFloat lableW=buttonW*0.8;
    CGFloat lableX=buttonW*0.1;
    CGFloat lableH=buttonH*0.4;
    return CGRectMake(lableX, lableY, lableW, lableH);
}

@end
