//
//  ViewController.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "ViewController.h"
#import "KLItemStore.h"
#import "BNRItem.h"
#import "CameraViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"]; 
    

    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIView *backgroundView = [[UIView alloc] initWithFrame:tableView.frame];
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage.jpg" inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil]];
    backImage.frame = self.view.frame;
    [backgroundView addSubview:backImage];
    [tableView setBackgroundView:backgroundView];

    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"UIView";
        
        for (int i = 0; i < 5; i++) {
            [[KLItemStore sharedStore] createItem];
        }
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[KLItemStore sharedStore] allItem] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[KLItemStore sharedStore] allItem];
    BNRItem *item = items[indexPath.row];

    
    NSString *iconName = [NSString stringWithFormat:@"index%d.jpg",arc4random_uniform(4)];

    
    cell.textLabel.text = [item description];
    cell.imageView.image = [UIImage imageNamed:iconName inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    cell.imageView.frame = CGRectMake(0, 0, 40, 40);
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor colorWithWhite:0.7f alpha:0.4f];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CameraViewController *cameraViewController = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:[NSBundle mainBundle]];
    
    NSArray *items = [[KLItemStore sharedStore] allItem];
    BNRItem *selectedItem = items[indexPath.row];
    
    // cameraViewController.items = selectedItem;
    
#pragma mark ------神奇的委托代理
    /*在ViewConreoller上加载了一个UITabelView然后通过遵守协议DateSource和UITabelViewDelegate利用协议方法加载cell，cell内容由BNRItem产生存在KLItemStore的单例中。
     然后通过点击屏幕进入CameraView（由此方法中的push方法实现，还可以通过present方法和Model方法实现跳转）。
     进入CameraView后需要传送被点击的Cell中的值，可以通过以下方法实现传值：1.在此方法中跳转以前存好值传入CameraView中的item属性；2.协议传值；3.block传值。。*/

    /*另一种协议方式，与上一种相反，ViewController作为代理，而CameraViewController作为委托。
     协议方法换做一个有返回值的方法（返回类型为BNRItem *）类型。这样CameraView不需要知道其他就只需要收到需要传递的值。*/
    cameraViewController.delegate = self;
    self.item = selectedItem;
    
    cameraViewController.actionBlock = ^(BNRItem *newItem)
    {
        
    };
    
    [self.navigationController pushViewController:cameraViewController animated:YES];
}

// 此处调用协议方法把值传递出去
- (BNRItem *)passValue {
    return self.item;
}

@end
