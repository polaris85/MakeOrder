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
#import "DrawView.h"
#import <MessageUI/MessageUI.h>
#import "IQDropDownTextField.h"

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet DLRadioButton *radioCustomer;
@property (weak, nonatomic) IBOutlet DLRadioButton *radioSystem;
@property (weak, nonatomic) IBOutlet DLRadioButton *radioPayment;

@property (weak, nonatomic) IBOutlet UITextField *txtHowDidYouLearn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UIView *viewRemarks;

@property (weak, nonatomic) IBOutlet UIImageView *imgSign;
@property (weak, nonatomic) IBOutlet DrawView *viewDraw;
@property (weak, nonatomic) IBOutlet UIView *viewSign;
@property (weak, nonatomic) IBOutlet UITextField *txtEmailAddress;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtIsolite;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtIsodry;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtIsovac;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtLarge;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtMediumDV;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtMedium;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtSmall;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtExtraSmall;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtPediatric;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtISO;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtIsoliteA;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtAdditional1;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *qtAdditional2;

@property (weak, nonatomic) IBOutlet UITextField *txtCreditCard;

@end

