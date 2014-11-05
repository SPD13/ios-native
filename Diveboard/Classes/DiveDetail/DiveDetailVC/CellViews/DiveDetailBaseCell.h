//
//  DiveDetailBaseCell.h
//  Diveboard
//
//  Created by SergeyPetrov on 11/3/14.
//  Copyright (c) 2014 threek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
@interface DiveDetailBaseCell : UITableViewCell

{
    DiveInformation* m_DiveInformation;
}


- (void)setDiveInformation : (DiveInformation*)diveInfo;

- (float)getHeight;

@end