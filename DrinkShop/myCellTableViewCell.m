//
//  myCellTableViewCell.m
//  DrinkShop
//
//  Created by Iris.Wu on 2018/3/9.
//  Copyright © 2018年 Iris.Wu. All rights reserved.
//

#import "myCellTableViewCell.h"


@implementation myCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x = 1;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1 * frame.origin.x;
    [super setFrame:frame];
}

@end
