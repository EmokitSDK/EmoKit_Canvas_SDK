//
//  CanvasView.h
//  emokitsdk
//
//  Created by EmoKit on 16/3/18.
//  Copyright © 2016年 com.yangxindian.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EMKCanvasDelegate <NSObject>

@optional

/**
 笔迹识别结果
 */
- (void)responseStylusData:(NSDictionary *)dic;

@end


@interface EMKCanvasView : UIView

@property (nonatomic, weak)id <EMKCanvasDelegate>delegate;

/**
 不设置默认为7种情绪
 rc_type=1，返回24种情绪
 rc_type=2，返回7种情绪
 rc_type=3，返回5种情绪
 */
@property (nonatomic, strong)NSString *rc_type;

/**
 请求笔迹识别情绪
 */
- (void)requestEmoWithStylusData;

/**
 清空画板
 */
- (void)clearCanvas;

@end
    
