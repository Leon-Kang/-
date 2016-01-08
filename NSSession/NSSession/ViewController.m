//
//  ViewController.m
//  NSSession
//
//  Created by 康梁 on 16/1/6.
//  Copyright © 2016年 kl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)addTableViewConstraints {
    self.tableView = [[UITableView alloc] init];
    
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *tableViewMap = @{@"tableView":self.tableView};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:0 metrics:nil views:tableViewMap];
    [self.view addConstraints:horizontalConstraints];
    
    NSArray *verticalConstraits = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[tableView]-0-|" options:0 metrics:nil views:tableViewMap];
    [self.view addConstraints:verticalConstraits];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getPaperInfo.php"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        NSString *receviedStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        self.dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", self.dataArr);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addTableViewConstraints];
            
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
        });
        
    }];
    
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }
    
    NSDictionary *paperDic = self.dataArr[indexPath.row];
    
    NSString *title = [paperDic valueForKey:@"title"];
    
    cell.textLabel.text = title;
    
    return cell;
}

@end
