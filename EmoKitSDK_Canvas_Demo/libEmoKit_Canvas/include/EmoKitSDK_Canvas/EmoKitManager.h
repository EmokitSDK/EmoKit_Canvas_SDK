//
//  HYMusicManager.h
//  HYMusic
//
//  Created by EmoKit on 16/4/12.
//  Copyright © 2016年 com.yangxindian.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmoKitManager : NSObject

/**
 设置申请获取的应用Key和Id
 @param appKey 申请的有效appKey
 @param appId  申请的有效appId
 */
+ (void)startAppKey:(NSString *)appKey AppId:(NSString *)appId;

@end
