//
//  KLReminderViewController.m
//  KLNewProject
//
//  Created by 康梁 on 15/11/16.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "KLReminderViewController.h"

@interface KLReminderViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

//@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation KLReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.button addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)return:(id)sender {
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)reminde:(UIButton *)sender {
    NSDateFormatter *dateForematter = [[NSDateFormatter alloc]init];
    //    [dateForematter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateForematter.dateStyle = NSDateFormatterMediumStyle;
    dateForematter.timeStyle = NSDateFormatterLongStyle;
    self.dateLabel.text = [dateForematter stringFromDate:self.datePicker.date];
    NSDate *date = self.datePicker.date;
    
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.timeZone = [NSTimeZone defaultTimeZone];
    
    note.soundName = UILocalNotificationDefaultSoundName;

    note.alertBody = @"Hypnotize me!";
    note.alertAction = @"查看";
    
    note.fireDate = date;
    
    // 在规定时间发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
    // 立即发送一个通知
    [[UIApplication sharedApplication] presentLocalNotificationNow:note];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Time";
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
        
        UINavigationItem *navItem = self.navigationItem;
        
        navItem.title = @"Reminder me!";
        
    }
    return self;
}

//- (IBAction)addReminder:(id)sender {
//    NSLog(@"remind");
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
