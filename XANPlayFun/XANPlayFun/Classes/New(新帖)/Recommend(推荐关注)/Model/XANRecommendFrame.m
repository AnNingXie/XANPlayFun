//
//  XANRecommendFrame.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANRecommendFrame.h"
#import "XANPublic.h"

@implementation XANRecommendFrame

-(void)setStatus:(XANRecommendStatus *)status{
    _status=status;
    
    //设置所有控件frame
    [self setUpFrames];
}

/**
 设置所有控件frame
 */
-(void)setUpFrames{
    //icon
    CGFloat iconX=10;
    CGFloat iconY=10;
    CGFloat iconW=60;
    CGFloat iconH=60;
    self.iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    //名称frame
    CGFloat nameX=CGRectGetMaxX(self.iconFrame)+10;
    CGFloat nameY=iconY;
    self.nameFrame=CGRectMake(nameX, nameY, 100, 30);
    
    //订阅人数frame
    CGFloat numberX=nameX;
    CGFloat numberY=CGRectGetMaxY(self.iconFrame)-30;
    self.numberFrame=CGRectMake(numberX, numberY, 100, 30);
  
    //订阅按钮frame
    CGFloat rssButtonW=50;
    CGFloat rssButtonX=KScreenWidth-rssButtonW-10;
    CGFloat rssButtonH=30;
    CGFloat rssButtonY=40-rssButtonH*0.5;
    self.rssButtonFrame=CGRectMake(rssButtonX, rssButtonY, rssButtonW, rssButtonH);
    
    //分割线frame
    CGFloat lineX=0;
    CGFloat lineY=CGRectGetMaxY(self.iconFrame)+9;
    CGFloat lineW=KScreenWidth;
    CGFloat lineH=1;
    self.LineFrame=CGRectMake(lineX, lineY, lineW, lineH);
}

@end
