//
//  XANFileTool.m
//  XANPlayFun
//
//  Created by XAN on 2018/4/23.
//  Copyright © 2018年 谢安宁. All rights reserved.
//

#import "XANFileTool.h"

@implementation XANFileTool
/**
 获取某一路径下的文件夹的尺寸
 
 @param path 文件夹路径
 @return 返回文件夹尺寸
 */
+(NSInteger)getFileSizeWithPath:(NSString *)path{
    //获取文件管理者
    NSFileManager *manager=[NSFileManager defaultManager];
    
    //判断是否是文件夹
    BOOL isDirectory; //判断文件是否存在，并且是不是文件夹
    BOOL isExist=[manager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory){//文件夹路径不存在或者不是文件夹，就崩溃
        //抛异常
     NSException *excep=[NSException exceptionWithName:@"error path" reason:@"请传入一个文件夹路径，路径要存在" userInfo:nil];
        [excep raise];
    }
    
    //获取某一文件夹下的所有文件的路径
    NSArray *subPaths=[manager subpathsAtPath:path];
    NSInteger totalSize=0;
    //遍历所有文件的路径
    for (NSString *subPath in subPaths) {
        //拼接所有文件的路径获取文件的全路径
        NSString *filePath=[path stringByAppendingPathComponent:subPath];
        //判断是否是隐藏文件
        if ([filePath containsString:@".DS"]) continue;
        //判断是否是文件夹
        BOOL isDirectory; //判断文件是否存在，并且是不是文件夹
        BOOL isExist=[manager fileExistsAtPath:filePath isDirectory:&isDirectory];
        if (!isExist || isDirectory) continue;//如果文件不存在或者是是文件夹跳过去
        
        NSDictionary *attrs=[manager attributesOfItemAtPath:filePath error:nil];
        //计算单个文件尺寸
        NSInteger fileSize=[attrs fileSize];
        totalSize+=fileSize;
    }
    return totalSize;
}


/**
 获取某一路径下的文件夹的尺寸
 
 @param path 文件夹路径不能是文件路径
 @param completion 计算完成之后调用的Block
 */
+(void)getFileSizeWithPath:(NSString *)path completion:(void(^)(NSInteger totalSize))completion{
    //获取文件管理者
    NSFileManager *manager=[NSFileManager defaultManager];
    
    //判断是否是文件夹
    BOOL isDirectory; //判断文件是否存在，并且是不是文件夹
    BOOL isExist=[manager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory){//文件夹路径不存在或者是不是文件夹，就崩溃
        //抛异常
        NSException *excep=[NSException exceptionWithName:@"error path" reason:@"请传入一个文件夹路径，路径要存在" userInfo:nil];
        [excep raise];
    }
    //开启一个异步线程进行缓存的计算
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //获取某一文件夹下的所有文件的路径
        NSArray *subPaths=[manager subpathsAtPath:path];
        NSInteger totalSize=0;
        //遍历所有文件的路径
        for (NSString *subPath in subPaths) {
            //拼接所有文件的路径获取文件的全路径
            NSString *filePath=[path stringByAppendingPathComponent:subPath];
            //判断是否是隐藏文件
            if ([filePath containsString:@".DS"]) continue;
            //判断是否是文件夹
            BOOL isDirectory; //判断文件是否存在，并且是不是文件夹
            BOOL isExist=[manager fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) continue;//如果文件不存在或者是是文件夹跳过去
            
            NSDictionary *attrs=[manager attributesOfItemAtPath:filePath error:nil];
            //计算单个文件尺寸
            NSInteger fileSize=[attrs fileSize];
            totalSize+=fileSize;
        }
        dispatch_async(dispatch_get_main_queue(), ^{//回到主线程把尺寸通过Block传出去
            if (completion) {
                completion(totalSize);
            }
        });
    });
}

/**
 删除某一文件下的所有文件
 
 @param path 文件夹路径
 */
+(void)removeFileWithPath:(NSString *)path{
    //获取文件管理者
    NSFileManager *manager=[NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDirectory; //判断文件是否存在，并且是不是文件夹
    BOOL isExist=[manager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory){//文件夹路径不存在或者是不是文件夹，就崩溃
        //抛异常
        NSException *excep=[NSException exceptionWithName:@"error path" reason:@"请传入一个文件夹路径，路径要存在" userInfo:nil];
        [excep raise];
    }
    //获取cache文件路径下的所有文件，不包括子路径的子路径
    NSArray *subPaths=[manager contentsOfDirectoryAtPath:path error:nil];
    for (NSString *subPath in subPaths) {
        //拼接完整路径
        NSString *filePath=[path stringByAppendingPathComponent:subPath];
        //删除文件
        [manager removeItemAtPath:filePath error:nil];
    }
}



@end
