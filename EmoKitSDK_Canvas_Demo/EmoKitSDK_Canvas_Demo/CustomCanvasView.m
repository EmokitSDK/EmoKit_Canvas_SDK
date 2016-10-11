//
//  EMKCustomView.m
//  EmoKitSDK_Canvas_Demo
//
//  Created by zhan on 16/9/14.
//  Copyright © 2016年 zhan. All rights reserved.
//

#import "CustomCanvasView.h"

@implementation CustomCanvasView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [super drawRect:rect];
}


#pragma mark UIResponder Touch method
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

@end
