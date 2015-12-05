//
//  KLUITableViewController.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/20.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLUITableViewController.h"
#import "KLItemStore.h"
#import "BNRItem.h"

@implementation KLUITableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"TabelView";

        for (int i = 0; i < 5; i++) {
            [[KLItemStore sharedStore] createItem];
        }
        NSArray *array = [[KLItemStore sharedStore] allItem];
        NSLog(@"%@", array);
    }
    return self;
}

//- (instancetype)initWithStyle:(UITableViewStyle)style
//{
//    return [self init];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[KLItemStore sharedStore] allItem] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[KLItemStore sharedStore] allItem];
    BNRItem *item = items[indexPath.row];
    
//    UIButton *icon = [[UIButton alloc] init];
    
    NSString *iconName = [NSString stringWithFormat:@"index%d.jpg",arc4random_uniform(4)];
//    [icon setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
//    
//    icon.frame = CGRectMake(0, 0, 40, 40);
//    [cell addSubview:icon];
    
    cell.textLabel.text = [item description];
    cell.imageView.image = [UIImage imageNamed:iconName inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    cell.imageView.frame = CGRectMake(0, 0, 40, 40);
    
    return cell;
}

@end
