//
//  ViewController.h
//  CoreDataDatabase
//
//  Created by Suresh on 2/21/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate>

- (IBAction)add:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UITextField *idTextField;

@property (strong, nonatomic) IBOutlet UITextField *designationTextField;

@property (strong, nonatomic) IBOutlet UITextField *companyTextField;




@end

