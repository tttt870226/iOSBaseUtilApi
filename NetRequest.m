//
//  NetRequest.m
//  iOSBaseUtilApi
//
//  Created by skynj on 2020/9/29.
//

#import "NetRequest.h"

@implementation NetRequest

/**
 普通的网络请求
 @param method POST GET
 @param url 请求url
 @param params 请求参数
 @param cookies cookies
 @param block 回调
 */
+ (NSURLSessionTask *)requestWithMethods:(NSString *)method
                                     url:(NSString *)url
                                  params:(NSDictionary *)params
                                 cookies:(NSArray *)cookies
                                   block:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))block {
    NSMutableURLRequest *request = nil;
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    if ([method isEqualToString:@"GET"]) {
        NSString *body = [self getPrams:params];
        if (body.length > 0) {
            url = [url stringByAppendingFormat:@"?%@",body];
            url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];  //新版本改用这个了，对url中文转码
        }
        request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    }else if ([method isEqualToString:@"POST"]) {
        if (params==nil) {
            return nil;
        }
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                         error:nil];
        NSString *bodys = [[NSString alloc] initWithData:data
                                                encoding:NSUTF8StringEncoding];
        NSData *bodyData = [bodys dataUsingEncoding: NSUTF8StringEncoding];
        [request setHTTPBody: bodyData];
    }
    request.HTTPMethod = method;
    request.timeoutInterval = 30;
    [request addValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    for (NSDictionary *obj in cookies) {
        for (NSString *key in obj.allKeys) {
            [request addValue:obj[key] forHTTPHeaderField:key];
        }
    }
    NSURLSession *postSession = [NSURLSession sharedSession];
    NSURLSessionTask *uploadTask = [[NSURLSessionTask alloc]init];
    uploadTask = [postSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            if (block) {
                block(data,response,error);
            }
        }else{
            if (block) {
                block(data,response,error);
            }
        }
    }];
    [uploadTask resume];
    return uploadTask;
}

+ (NSString*)getPrams:(NSDictionary*)params{
    if (!params||params.count == 0) {
        return @"";
    }
    NSMutableString *mutableStr= [NSMutableString string];
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mutableStr appendFormat:@"%@=",key];
        [mutableStr appendFormat:@"%@&",obj];
    }];
    [mutableStr deleteCharactersInRange:NSMakeRange(mutableStr.length-1, 1)];
    return mutableStr;
}


@end
