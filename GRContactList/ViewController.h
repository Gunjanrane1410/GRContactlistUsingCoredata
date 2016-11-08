//
//  ViewController.h
//  GRContactList
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "customTableViewCell.h"
#import "addViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *contactListArray;
}

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)addAction:(id)sender;

@end

