//
//  AlertViewController.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/13.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()
@end

@implementation AlertViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.1];
    self.titleLabel.text = self.name;
    [self.titleLabel sizeToFit];
    [self setDefaultButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setDefaultButton {
    
    if([self.type isEqual: @"tea"])
    {
        self.largeSwitch.on = YES;
        self.largeSwitch.enabled = NO;
        self.middleSwitch.on = NO;
        self.middleSwitch.enabled = NO;
    }
    
    if([self.type isEqual: @"milk tea"])
    {
        self.largeSwitch.enabled = NO;
        self.middleSwitch.enabled = NO;
        self.allSSwitch.on = NO;
        self.sugarView.hidden = YES;
    }
    
    if([self.type isEqual: @"tea latte"])
    {
        self.noSSwitch.hidden = YES;
        self.noSLabel.hidden = YES;
    }
    
    if([self.type isEqual: @"special drink"])
    {
        self.largeSwitch.enabled = NO;
        self.middleSwitch.enabled = NO;
        self.ingredientView.hidden = NO;
    }
}


- (IBAction)clickSave:(id)sender {
    DrinkData *data = [[DrinkData alloc] init];
    data.name = self.titleLabel.text;
    data.size = self.largeSwitch.on? @"-L" : @"-M";
    data.bubble = self.bubbleSwitch.on;
    data.soda = self.sodaSwitch.on;
    if(self.allSSwitch.on){
        data.sugar = @",All S";
    }
    else if (self.halfSSwitch.on){
        data.sugar = @",Half S";
    }
    else if(self.noSSwitch.on){
        data.sugar = @",No S";
    }
    else
    {
        data.sugar = @"";
    }
    data.idNum = self.idNum;
    
    [data getDrinkString];
    [self.delegate saveData:data];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


- (IBAction)clickCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (IBAction)changeSize:(id)sender {
    UISwitch *switchItem = (UISwitch *)sender;
    
    self.middleSwitch.on = NO;
    self.largeSwitch.on = NO;
    
    switch (switchItem.tag) {
        case 1:
            self.middleSwitch.on = YES;
            break;
            
        case 2:
            self.largeSwitch.on = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)changeSugar:(id)sender {
    UISwitch *switchItem = (UISwitch *)sender;
    self.allSSwitch.on = NO;
    self.halfSSwitch.on = NO;
    self.noSSwitch.on = NO;
    
    switch (switchItem.tag) {
        case 3:
            self.allSSwitch.on = YES;
            break;
            
        case 4:
            self.halfSSwitch.on = YES;
            break;
            
        case 5:
            self.noSSwitch.on = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)changeIngredient:(id)sender {
    UISwitch *switchItem = (UISwitch *)sender;
    self.bubbleSwitch.on = NO;
    self.sodaSwitch.on = NO;
    
    switch (switchItem.tag) {
        case 6:
            self.bubbleSwitch.on = YES;
            break;
            
        case 7:
            self.sodaSwitch.on = YES;
            break;
            
        default:
            break;
    }
}

@end
