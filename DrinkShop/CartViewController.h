//
//  CartViewController.h
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/14.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkData.h"

@interface CartViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,weak) NSMutableDictionary<NSString *,NSMutableArray<DrinkData *> *> *cartDictionary;
@property (strong, nonatomic) IBOutlet UITableView *cartTable;

@end
