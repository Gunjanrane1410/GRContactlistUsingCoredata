//
//  addViewController.h
//  GRContactList
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface addViewController : UIViewController
- (IBAction)cancelAction:(id)sender;

- (IBAction)doneAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *numberField;
@end
