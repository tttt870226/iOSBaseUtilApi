//
//  BaseUtilApi.h
//  iOSBaseUtilApi
//
//  Created by skynj on 2020/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseUtilApi : NSObject


/*
 *获取设备名称
 */
+(NSString*)getDeviceName;
/**
 *获取手机系统版本
 */
+(NSString*)getPhoneVersion;
/**
 *获取手机型号简单型号
 */
+(NSString*)getSimpleModel;
/**
 *获取手机udid
 */
+(NSUUID*)getUDID;
/**
 *获取手机别名
 */
+(NSString*)getPhoneName;
/**
 *获取当前应用的名称
 */
+(NSString*)getAppName;
/**
 *获取应用版本 1.0.1
 */
+(NSString*)getAppVersion;
/**
 *获取bundleId
 */
+(NSString*)getBundleId;
/**
 *获取版本code
 */
+(NSString*)getAppVersionCode;
/**
 *详细手机型号
 */
+(NSString*)getDetailPhoneType;
@end

NS_ASSUME_NONNULL_END
