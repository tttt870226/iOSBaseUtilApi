//
//  NetRequest.h
//  iOSBaseUtilApi
//
//  Created by skynj on 2020/9/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetRequest : NSObject

/**
 普通的网络请求 content_type是这种格式的:application/json;charset=UTF-8 只支持这种格式的
 @param method POST GET
 @param url 请求url
 @param params 请求参数
 @param cookies cookies
 @param block 回调
 */
+ (NSURLSessionTask *)requestWithMethods:(NSString *)method
                                     url:(NSString * __nullable)url
                                  params:(NSDictionary * __nullable)params
                                 cookies:(NSArray * __nullable)cookies
                                   block:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))block;
@end

NS_ASSUME_NONNULL_END
