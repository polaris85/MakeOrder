//
//  ViewController.h
//  OrderForm
//
//  Created by Star Developer on 2/25/16.
//  Copyright © 2016 Isolite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DLRadioButton/DLRadioButton.h>
#import "UITextField+Underlined.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet DLRadioButton *radioCustomer;
@property (weak, nonatomic) IBOutlet DLRadioButton *radioSystem;
@property (weak, nonatomic) IBOutlet DLRadioButton *radioPayment;

@property (weak, nonatomic) IBOutlet UITextField *txtHowDidYouLearn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UIView *viewRemarks;

@property (weak, nonatomic) IBOutlet UIImageView *imgSign;

@end

