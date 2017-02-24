//
//  ViewController.m
//  test
//
//  Created by yjcfxg on 2017/2/16.
//  Copyright © 2017年 yjcfxg. All rights reserved.
//

#import "ViewController.h"


//#define URL @"http://www.bus365.com/phoneparam0?code=102"
#define URL @"http://live.9158.com/Living/GetAD"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) NSArray *arr;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

@property (nonatomic, retain)NSTimer *scrollTimer;
@property (nonatomic,strong) NSMutableArray *ImageViewArray;

@end

@implementation ViewController
/*
 
 // 创建gcd group
 serviceGroup = dispatch_group_create();
 for (NSInteger i = 1; i < 5; i++) {
 // 将任务放入 group中
 dispatch_group_enter(serviceGroup);
 // 网络任务
 // 在block中将任务移出group
 dispatch_group_leave(serviceGroup);
 }
 dispatch_group_notify(serviceGroup, dispatch_get_main_queue(), ^{
 // 任务全部完成处理
 NSLog(@"完成");
 });
 
 */

- (NSArray *)arr
{
    if (!_arr) {
        _arr = [NSArray array];
    }
    return _arr;
}

- (NSMutableArray *)ImageViewArray
{
    if (!_ImageViewArray) {
        _ImageViewArray = [NSMutableArray array];
    }
    return _ImageViewArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /*
     NSURL *url = [NSURL URLWithString:URL];
     NSURLRequest *req = [NSURLRequest requestWithURL:url];
     [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
     
     _arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
     NSLog(@"%@",_arr[0][@"description"]);
     }];
     */
    /*
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     
     　　//子线程中开始网络请求数据
     NSURLSession *session = [NSURLSession sharedSession];
     NSURL *url = [NSURL URLWithString:URL];
     // 通过URL初始化task,在block内部可以直接对返回的数据进行处理
     NSURLSessionTask *task = [session dataTaskWithURL:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
     NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
     _arr = [NSArray arrayWithArray:dict[@"data"]];
     NSLog(@"%@",_arr);
     
     }];
     
     // 启动任务
     [task resume];
     
     
     　　//更新数据模型
     
     　　dispatch_sync(dispatch_get_main_queue(), ^{
     
     　　　　//在主线程中更新UI代码
     
     
     　　});
     
     });
     
     */
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     // Do any additional setup after loading the view, typically from a nib.
     NSString *str = @"20|http:wwww.621life.com";
     NSArray *arr = [str componentsSeparatedByString:@"|"];
     NSLog(@"%@",arr);
     NSDictionary *di = @{@"key1":@"value1",@"key2":@"value2"};
     NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:di];
     [dict setObject:@"value3" forKey:@"key3"];
     
     [dict removeObjectForKey:dict.allKeys[arc4random_uniform(1)+1]];
     NSLog(@"%@",dict);
     
     NSArray *a = [NSArray arrayWithArray:_arr[0][@"description"]];
     for (NSDictionary *dict in a) {
     if ([dict[@"id"] isEqualToString:@"3"]) {
     NSLog(@"%@",dict[@"id"]);
     }
     
     }
     [self addAllView];
     */
    
    /*
     NSURL *url = [NSURL URLWithString:URL];
     NSURLRequest *req = [NSURLRequest requestWithURL:url];
     
     [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
     
     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
     _arr = [NSArray arrayWithArray:dict[@"data"]];
     NSLog(@"%@",_arr);
     }];
     */
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i < 4; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, 150)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [self.scrollView addSubview:imageView];
        [_ImageViewArray addObject:imageView];
        
    }
    
    _scrollView.contentSize = CGSizeMake(WIDTH * 4, 0);
    _scrollView.bounces = NO;//去除弹簧效果
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 120, WIDTH, 30)];
    _pageControl.numberOfPages = 4;
    _pageControl.backgroundColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(Scroll:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    [self startScroll];
    
}


#pragma UIScrollViewDelegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x /WIDTH;
    
    /*
     // 如果向右滑回到了第一张
     if (index == 5) {
     // 跳回到第一张
     _scrollView.contentOffset = CGPointMake(WIDTH, 0);
     index = 1;
     }
     // 如果向左从第一张滑到了最后一张
     if (index == 0 || index > 5) {
     
     _scrollView.contentOffset = CGPointMake(4 * WIDTH, 0);
     index = 4;
     
     }
     */
    
    _pageControl.currentPage = index;
    /*
     UIImageView *imgView = _ImageViewArray[index - 1];
     imgView.frame = CGRectMake((index - 1) *WIDTH, 0, WIDTH, 150);
     imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",index-1]];
     */
    
    //    [self resetFrame];
    
}


#pragma UIPageControl event  Method
- (void)Scroll:(UIPageControl *)page
{
    //    _scrollView.contentOffset = CGPointMake(page.currentPage * WIDTH, 0);
    [_scrollView setContentOffset:CGPointMake(page.currentPage * WIDTH, 0) animated:YES];
}


// 开始拖拽的时候调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    [self stopScroll];
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //防止timer被阻塞
    [[NSRunLoop currentRunLoop] addTimer:self.scrollTimer forMode:NSRunLoopCommonModes];
    
}

#pragma mark 开始滚动图片
- (void)startScroll
{
    if (_scrollTimer) {
        return;
    }
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //防止timer被阻塞
    [[NSRunLoop currentRunLoop] addTimer:self.scrollTimer forMode:NSRunLoopCommonModes];
    
}

#pragma mark 滚动scrollView
- (void)nextImage
{
    int page = (int)self.pageControl.currentPage;
    NSInteger imageCount = 4;
    if (page == imageCount-1) page = 0;
    else page++;
    
    // 滚动scrollview
    [UIView animateWithDuration:.5f animations:^{
        CGFloat x = page * self.scrollView.frame.size.width;
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }];
    /*
     // 计算offset
     CGPoint newOffset = _scrollView.contentOffset;
     newOffset.x += WIDTH;
     // 进行滚动
     [_scrollView setContentOffset:newOffset animated:YES];
     // 锁定控件
     _scrollView.userInteractionEnabled = NO;
     // 调用方法
     [self performSelector:@selector(scrollViewDidScroll:) withObject:_scrollView afterDelay:.5];
     [self performSelector:@selector(unlockUserInteraction:) withObject:_scrollView afterDelay:.51];
     */
}

#pragma mark 解锁控件
- (void)unlockUserInteraction:(UIView *)view
{
    view.userInteractionEnabled = YES;
}

#pragma mark 停止滚动图片
- (void)stopScroll
{
    [_scrollTimer invalidate];
}

#pragma mark - UIScrollViewDelegateMethods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 计算出当前显示的News的index
    int index = scrollView.contentOffset.x / WIDTH;
    
    
    
    _pageControl.currentPage = index;
    /*
     UIImageView *imgView = _ImageViewArray[index - 1];
     imgView.frame = CGRectMake((index - 1) *WIDTH, 0, WIDTH, 150);
     imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index-1]];
     
     */
    
    
}



@end
