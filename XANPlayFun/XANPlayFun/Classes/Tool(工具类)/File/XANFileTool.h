//
//  XANFileTool.h
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XANFileTool : NSObject

/**
 获取某一路径下的文件夹的尺寸

 @param path 文件夹路径不能是文件路径
 @return 返回文件夹尺寸
 */
+(NSInteger)getFileSizeWithPath:(NSString *)path;

/**
 获取某一路径下的文件夹的尺寸

 @param path 文件夹路径不能是文件路径
 @param completion 计算完成之后调用的Block
 */
+(void)getFileSizeWithPath:(NSString *)path completion:(void(^)(NSInteger totalSize))completion;

/**
 删除某一文件下的所有文件

 @param path 文件夹路径不能是文件路径
 */
+(void)removeFileWithPath:(NSString *)path;

@end
