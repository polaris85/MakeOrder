//
//  ViewController.m
//  OrderForm
//
//  Created by Star Developer on 2/25/16.
//  Copyright © 2016 Isolite. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    UIView * coverView;
    NSMutableArray *arrQuantityDropDown;
}

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
    
    self.viewSign.layer.cornerRadius = 5.0;
    self.viewSign.hidden = YES;
    
    self.viewDraw.strokeColor = [UIColor blackColor];
    self.viewDraw.strokeWidth = 2.0;
    
    arrQuantityDropDown = [[NSMutableArray alloc] init];
    for (int i=0; i<=100; i++) {
        [arrQuantityDropDown addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    self.qtIsolite.isOptionalDropDown = NO;
    [self.qtIsolite setItemList:arrQuantityDropDown];
    self.qtIsodry.isOptionalDropDown = NO;
    [self.qtIsodry setItemList:arrQuantityDropDown];
    self.qtIsovac.isOptionalDropDown = NO;
    [self.qtIsovac setItemList:arrQuantityDropDown];
    self.qtLarge.isOptionalDropDown = NO;
    [self.qtLarge setItemList:arrQuantityDropDown];
    self.qtMediumDV.isOptionalDropDown = NO;
    [self.qtMediumDV setItemList:arrQuantityDropDown];
    self.qtMedium.isOptionalDropDown = NO;
    [self.qtMedium setItemList:arrQuantityDropDown];
    self.qtSmall.isOptionalDropDown = NO;
    [self.qtSmall setItemList:arrQuantityDropDown];
    self.qtExtraSmall.isOptionalDropDown = NO;
    [self.qtExtraSmall setItemList:arrQuantityDropDown];
    self.qtPediatric.isOptionalDropDown = NO;
    [self.qtPediatric setItemList:arrQuantityDropDown];
    self.qtISO.isOptionalDropDown = NO;
    [self.qtISO setItemList:arrQuantityDropDown];
    self.qtIsoliteA.isOptionalDropDown = NO;
    [self.qtIsoliteA setItemList:arrQuantityDropDown];
    self.qtAdditional1.isOptionalDropDown = NO;
    [self.qtAdditional1 setItemList:arrQuantityDropDown];
    self.qtAdditional2.isOptionalDropDown = NO;
    [self.qtAdditional2 setItemList:arrQuantityDropDown];
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.imgSign addGestureRecognizer:singleTap];
    
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
- (IBAction)onClickOK:(id)sender {
    self.viewSign.hidden = YES;
    [coverView removeFromSuperview];
    [self.imgSign setImage:[self.viewDraw imageRepresentation]];
}
- (IBAction)onClickClear:(id)sender {
    [self.viewDraw clearDrawing];
    
}
-(void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    self.viewSign.hidden = NO;
    if(coverView==nil){
        coverView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:coverView];
    [self.view bringSubviewToFront:self.viewSign];
}
- (IBAction)onClickSend:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        //mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        [mailer setSubject:@"New Digital Order Submission"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:self.txtEmailAddress.text, nil];
        [mailer setToRecipients:toRecipients];
        
        //UIImage *signature = self.imgSign.image;
        UIImage * form = [self imageWithView:self.contentView];
        
        NSData *imageData = UIImagePNGRepresentation(form);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"order-form"];
        
        NSString *emailBody = @"This is an order from customer. Please check the attachment.";
        [mailer setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        NSLog(@"Can't send the email.");

    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

-(BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"Lost forcus");
    return YES;
}

@end
