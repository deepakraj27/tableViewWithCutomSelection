//
//  SingleSelectionTable.m
//  tableViewWithCustomSelection
//
//  Created by deepakraj murugesan on 22/09/16.
//  Copyright © 2016 deepakraj murugesan. All rights reserved.
//

#import "SingleSelectionTable.h"

@interface SingleSelectionTable() 
@property (weak, nonatomic) IBOutlet UILabel *heading;
@end
@implementation SingleSelectionTable

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - HeadingValueSetter
-(void)setSingleSelectionCellData:(NSDictionary *)singleSelectionCellData{
    
    NSString * Heading1 = singleSelectionCellData[@"heading"];
    self.heading.text = Heading1;

    _singleSelectionCellData =  singleSelectionCellData;
}
@end
