//
//  PlayController.m
//  转场动画
//
//  Created by joker on 16/2/5.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "PlayController.h"

@interface PlayController ()

@end

@implementation PlayController

- (void)loadView
{
    self.view = [[UIView alloc] init];

    //注意anchorPoint的设置一定要在view的frame设置之前,因此放在此方法里
    self.view.layer.anchorPoint = CGPointMake(0.5, 2);
    self.view.backgroundColor = [UIColor blueColor];
    self.view.frame = [UIScreen mainScreen].bounds;
    
    //添加一个手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"海绵宝宝.jpeg"];
    [self.view addSubview:imageView];
    
    
    
    
}

- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        if (self.view.transform.b >= 0.24 || self.view.transform.b <= -0.24) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }else
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.view.transform = CGAffineTransformIdentity;
            }];
        }
    }else
    {
        CGFloat offsetX = [pan translationInView:self.view].x;
        CGFloat percent = offsetX / self.view.bounds.size.width;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_4 * percent);
        NSLog(@"%f,%f",self.view.transform.a,self.view.transform.b);
    }
}




@end
