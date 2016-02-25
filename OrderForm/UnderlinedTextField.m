//
//  UnderlinedTextField.m
//  OrderForm
//
//  Created by Star Developer on 2/25/16.
//  Copyright © 2016 Isolite. All rights reserved.
//

#import "UnderlinedTextField.h"

@implementation UnderlinedTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor darkGrayColor].CGColor;
    [self.layer addSublayer:bottomBorder];
}


@end
