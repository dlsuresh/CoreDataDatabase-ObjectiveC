//
//  ViewController.m
//  CoreDataDatabase
//
//  Created by Suresh on 2/21/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    namearray = [[NSMutableArray alloc]init];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSManagedObjectContext *)getContext{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    return context;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)add:(id)sender {
    
    if ((self.nameTextField.text.length > 0) && (self.idTextField.text.length > 0) && (self.designationTextField.text.length > 0) && (self.companyTextField.text.length > 0)) {
        NSManagedObjectContext *context = [self getContext];
        NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        
        [obj setValue:self.idTextField.text forKey:@"id"];
        
        [obj setValue:self.nameTextField.text forKey:@"name"];
       
        [obj setValue:self.companyTextField.text forKey:@"company"];
        
        [obj setValue:self.designationTextField.text forKey:@"designation"];

        self.idTextField.text = @"";
        self.nameTextField.text = @"";
        self.designationTextField.text = @"";
        self.companyTextField.text = @"";

        [context save:nil];
        
        NSLog(@"Details have been saved ");
    
    
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];


}
@end
