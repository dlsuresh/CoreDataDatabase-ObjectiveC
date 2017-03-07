//
//  TableViewCell.h
//  CoreDataDatabase
//
//  Created by Suresh on 2/21/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelDesisgnation;

@property (strong, nonatomic) IBOutlet UILabel *labelId;

@property (strong, nonatomic) IBOutlet UILabel *labelCompany;


@end
