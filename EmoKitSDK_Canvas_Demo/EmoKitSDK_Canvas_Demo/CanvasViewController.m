//
//  CanvasViewController.m
//  EmokitSDKDemo
//
//  Created by zhan on 16/3/18.
//  Copyright © 2016年 zhan. All rights reserved.
//

#import "CanvasViewController.h"
#import "CustomCanvasView.h"

@interface CanvasViewController ()<EMKCanvasDelegate>

@property (nonatomic, strong)IBOutlet CustomCanvasView   *canvasView;
@property (nonatomic, strong)IBOutlet UIButton           *clearBtn;

@property (nonatomic, strong)UILabel  *emoResultLabel;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [EMKCanvasView class];
    self.canvasView.delegate = self;
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor redColor];
    
    _emoResultLabel = [[UILabel alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].bounds];
    _emoResultLabel.backgroundColor = [UIColor whiteColor];
    _emoResultLabel.font = [UIFont systemFontOfSize:25];
    _emoResultLabel.textAlignment = NSTextAlignmentCenter;
    _emoResultLabel.alpha = 0;
    [self.view addSubview:_emoResultLabel];
}

- (void)responseStylusData:(NSDictionary *)dic
{
    NSLog(@"StylusData:%@", dic);
    
    NSString *rc_main = dic[@"rc_main"];
    
    // 以下为默认的7种情绪码（其他5种、24种情绪码请查看文档）
    NSDictionary *emoDic = @{@"K": @"平静；放松；专注；出神",
                             @"D": @"忧愁；疑惑；迷茫；无助",
                             @"C": @"伤感；郁闷；痛心；压抑",
                             @"Y": @"生气；失控；兴奋；宣泄",
                             @"M": @"开心；甜蜜；欢快；舒畅",
                             @"W": @"害怕；焦虑；紧张；激情",
                             @"T": @"厌恶；反感；意外；惊讶",};
    
    NSString *emoStirng = emoDic[rc_main];
    
    self.emoResultLabel.text = emoStirng;
    self.emoResultLabel.frame = [[UIApplication sharedApplication] keyWindow].bounds;
    
    self.view.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.6
                     animations:^{
                         self.emoResultLabel.text = emoStirng;
                         self.emoResultLabel.alpha = 1.0;

                     } completion:^(BOOL finished) {
                         
                         [self performSelector:@selector(hiddenEmoResult) withObject:nil afterDelay:2.0];
                     }];
}

- (void)hiddenEmoResult
{
    [UIView animateWithDuration:0.6
                     animations:^{
                         self.emoResultLabel.text = @"";
                         self.emoResultLabel.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                         self.view.userInteractionEnabled = YES;

                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearAction:(id)sender
{
    [self.canvasView clearCanvas];
}

- (IBAction)getEmotion:(id)sender
{
    [self.canvasView requestEmoWithStylusData];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
