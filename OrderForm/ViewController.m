//
//  ViewController.m
//  OrderForm
//
//  Created by Star Developer on 2/25/16.
//  Copyright © 2016 Isolite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.radioCustomer.selected = YES;
    self.radioSystem.multipleSelectionEnabled = YES;
//    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 1500)];
    self.viewHeader.layer.borderWidth = 1.0;
    self.viewHeader.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.viewRemarks.layer.borderWidth = 1.0;
    self.viewRemarks.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSelectedCustomerType:(DLRadioButton*)radio {
    NSLog(@"%@ is selected.\n", radio.selectedButton.titleLabel.text);
}
- (IBAction)onSelectSystem:(DLRadioButton*)radio {
    NSLog(@"%@ is selected.\n", radio.selectedButton.titleLabel.text);
}
- (IBAction)onSelectPaymentType:(DLRadioButton*)radio {
    NSLog(@"%@ is selected.\n", radio.selectedButton.titleLabel.text);
}

@end
