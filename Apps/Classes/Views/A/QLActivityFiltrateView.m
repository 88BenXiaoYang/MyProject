//
//  QLActivityFiltrateView.m
//  Toon
//
//  Created by bianyong on 2018/1/9.
//

#import "QLActivityFiltrateView.h"

@interface QLActivityFiltrateView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *detailShowView;

@end

@implementation QLActivityFiltrateView

#pragma mark- Live circle

#pragma mark- Overwrite
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//
//    [self dismissView];
//}

#pragma mark- Delegate
#pragma mark- Notification methods
#pragma mark- Interface methods
#pragma mark- Event Response methods
- (void)swipLeft
{
    [self dismissView];
}

#pragma mark- Net request
#pragma mark- Private methods
- (void)showView
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipLeft)];
//    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeGesture];
    
    [self addSubview:self.bgView];
    [self addSubview:self.detailShowView];
    
//    [_detailShowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(200, 300));
//        make.center.equalTo(self);
//    }];
    
    CGRect frame = self.detailShowView.frame;
    frame.origin.x = 60;
    
    [UIView animateWithDuration:.25 animations:^{
//        self.detailShowView.layer.affineTransform = CGAffineTransformMakeScale(1, 1);
//        self.detailShowView.alpha = 1;
        self.detailShowView.frame = frame;
    }];
}

- (void)dismissView
{
    CGRect frame = self.detailShowView.frame;
    frame.origin.x = SCREEN_WIDTH;
    
    [UIView animateWithDuration:.25 animations:^{
//        self.detailShowView.layer.affineTransform = CGAffineTransformMakeScale(0.5, 0.5);
//        self.detailShowView.alpha = 0;
        self.detailShowView.frame = frame;
        self.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark- Setter and getter
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.5;
    }
    return _bgView;
}

- (UIView *)detailShowView
{
    if (!_detailShowView) {
        _detailShowView = [[UIView alloc] init];
        _detailShowView.backgroundColor = [UIColor whiteColor];
        _detailShowView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH - 60, SCREEN_HEIGHT);
    }
    return _detailShowView;
}

@end
