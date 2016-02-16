//
//  ViewController.m
//  转场动画
//
//  Created by joker on 16/2/5.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "ViewController.h"
#import "PlayController.h"
#import "JMControllerDismissStrategy.h"
#import "JMControllerPresentingStrategy.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic,strong) UIView *playView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}





- (IBAction)showPlayVC
{
    PlayController *playVC = [[PlayController alloc] init];
    //设置playVC的modal展示样式为自定义
    playVC.modalPresentationStyle = UIModalPresentationCustom;
    //设置代理
    playVC.transitioningDelegate = self;

    [self presentViewController:playVC animated:YES completion: nil];
}




#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    if ([presented isKindOfClass:[PlayController class]])
    {
            JMControllerPresentingStrategy *presentation = [[JMControllerPresentingStrategy alloc] init];
        
        return presentation;
    }else
        return nil;


}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    if ([dismissed isKindOfClass:[PlayController class]])
    {
        JMControllerDismissStrategy *presented = [[JMControllerDismissStrategy alloc] init];
        return presented;
    }else
        return nil;


}


@end
