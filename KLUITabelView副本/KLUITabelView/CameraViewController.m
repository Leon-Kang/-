//
//  CameraViewController.m
//  KLUITabelView
//
//  Created by 康梁 on 15/11/23.
//  Copyright © 2015年 kl. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewController.h"
#import "KLImageStore.h"

@interface CameraViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameValue;
@property (weak, nonatomic) IBOutlet UITextField *serialValue;
@property (weak, nonatomic) IBOutlet UITextField *value;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 此处实现收到传值
    self.items = [self.delegate passValue];

    self.nameValue.text = self.items.itemName;
    self.serialValue.text = self.items.serialNumber;
    self.value.text = [NSString stringWithFormat:@"%d", self.items.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:self.items.dateCreated];
    
    NSString *itemKey = self.items.itemKey;
    
    UIImage *imageToDisplay = [[KLImageStore sharedStore] imageForKey:itemKey];
    
    self.imageView.image = imageToDisplay;

    self.items.itemName = self.nameValue.text;
    self.items.serialNumber = self.serialValue.text;
    self.items.valueInDollars = (int)self.value.text;
    self.actionBlock(self.items);
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *cameraItem = self.navigationItem;
        cameraItem.title = @"CameraView";
    }
    return self;
}

- (IBAction)Camera:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [[KLImageStore sharedStore] setImage:image forKey:self.items.itemKey];
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (IBAction)backgrounpTapped:(id)sender {
    [self.view endEditing:YES];
}




@end
