//
//  ViewController.m
//  GRContactList
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 Gunjan Rane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myTableView setBackgroundColor:[UIColor clearColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated {
    
    [self fetchContactListFromCoreData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contactListArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"list_cell"];
    cell.backgroundColor = [UIColor clearColor];

    NSManagedObjectContext *contacts = [contactListArray objectAtIndex:indexPath.row];
    cell.nameField.text = [contacts valueForKey:@"name"];
    cell.numberField.text = [contacts valueForKey:@"number"];
    return cell;
    
}


-(void)fetchContactListFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Contacts"];
    NSError *error;
    contactListArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    else {
        [self.myTableView reloadData];
    }
    
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
    }
    
}

-(void)deleteEntry:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    
        [context deleteObject:[contactListArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            
            [self fetchContactListFromCoreData];
            
            [self.myTableView reloadData];
        }

}
- (IBAction)addAction:(id)sender {
    addViewController *addContacts = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
    [self.navigationController pushViewController:addContacts animated:YES];
}

@end
