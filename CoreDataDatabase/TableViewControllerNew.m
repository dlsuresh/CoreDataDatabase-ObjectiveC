//
//  TableViewController.m
//  CoreDataDatabase
//
//  Created by Suresh on 2/21/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "TableViewControllerNew.h"
#import "AppDelegate.h"
#import "TableViewCell.h"

@interface TableViewControllerNew (){
    NSMutableArray *databaseArray;
}

@end

@implementation TableViewControllerNew

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    
    
}
-(void)fetchData{
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]];
    
    databaseArray = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:request error:nil]];
    
    
}
-(NSManagedObjectContext *)getContext{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    return  context;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return databaseArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self.tableViewNew dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSManagedObject *obj = [databaseArray objectAtIndex:indexPath.row];
    cell.labelId.text = [obj valueForKey:@"id"];
    cell.labelName.text = [obj valueForKey:@"name"];
    cell.labelDesisgnation.text = [obj valueForKey:@"designation"];
    cell.labelCompany.text = [obj valueForKey:@"company"];
    
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self getContext];
        [context deleteObject:[databaseArray objectAtIndex:indexPath.row]];
        [databaseArray removeObjectAtIndex:indexPath.row];
        [context save:nil];
        [tableView reloadData];
        
    }
    
    
    
}



@end
