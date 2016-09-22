//
//  SingleSelectionTable.h
//  tableViewWithCustomSelection
//
//  Created by deepakraj murugesan on 22/09/16.
//  Copyright © 2016 deepakraj murugesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleSelectionTable : UITableViewCell
@property(nonatomic,weak)NSDictionary * singleSelectionCellData;
@property (weak, nonatomic) IBOutlet UIImageView *selected_img;
@property (weak, nonatomic) IBOutlet UIImageView *unselected_img;
@end
