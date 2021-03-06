//
//  DiveDetailDateCell.m
//  Diveboard
//
//  Created by Vladimir Popov on 11/2/14.
//  Copyright (c) 2014 Vladimir Popov. All rights reserved.
//

#import "DiveDetailDateCell.h"

@implementation DiveDetailDateCell

- (void)awakeFromNib {

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDiveInformation:(DiveInformation *)diveInfo
{
    [super setDiveInformation:diveInfo];
    
    
    // dive date
    [m_lblDate setText:[NSString stringWithFormat:@"%@ %@",
                                     m_DiveInformation.date,
                                     m_DiveInformation.time]];
    
    // dive duration
    CGRect leftFrame = m_viewDateBox.superview.frame;
    leftFrame.size.height = CGRectGetMaxY(m_lblDate.frame);
    
    
    [m_lblDuration   setText:[NSString stringWithFormat:@"%@ mins", m_DiveInformation.duration]];
    CGRect rightFrame = m_viewDurationBox.superview.frame;
    rightFrame.size.height = CGRectGetMaxY(m_lblDuration.frame);
    
    
    CGRect frame = m_viewVisibilityBox.frame;
    
    if (m_DiveInformation.visibility.length > 0) {

        [m_viewVisibilityBox setHidden:NO];
        
        [m_lblVisibility setText:[m_DiveInformation.visibility capitalizedString]];
        
        frame.origin.y = CGRectGetMaxY(frame);
        
        leftFrame.size.height = CGRectGetMaxY(m_lblVisibility.frame);
        
    } else {
        
        [m_viewVisibilityBox setHidden:YES];
        
    }
    
    [m_viewWaterBox setFrame:frame];
    
    if (m_DiveInformation.water.length > 0) {
        
        [m_viewWaterBox setHidden:NO];
        
        [m_lblWater setText:[m_DiveInformation.water capitalizedString]];
        
        leftFrame.size.height = CGRectGetMaxY(m_viewWaterBox.frame);
        
    } else {

        [m_viewWaterBox setHidden:YES];
    }
    
    
    frame = m_viewTempBox.frame;
    if (m_DiveInformation.temp.bottom.length > 0 || m_DiveInformation.temp.surface.length > 0) {
        
        [m_viewTempBox setHidden:NO];
        
        
        NSString* roundSURF = [DiveInformation unitOfTempWithValue:m_DiveInformation.temp.surfaceValue defaultUnit:m_DiveInformation.temp.surfaceUnit showUnit:NO];
        
        NSString* roundBottom = [DiveInformation unitOfTempWithValue:m_DiveInformation.temp.bottomValue defaultUnit:m_DiveInformation.temp.bottomUnit];

        NSString* surfStr = @"";
        NSString* bottomStr = @"";
        
        if ([AppManager sharedManager].userSettings.unit == UserSettingUnitTypeImperial) {
            // unit is imperial

            surfStr = [NSString stringWithFormat:@"%d °F",[roundSURF intValue]];
            bottomStr = [NSString stringWithFormat:@"%d °F",[roundBottom intValue]];
            
        }else{
            
            surfStr = [NSString stringWithFormat:@"%d °C",[roundSURF intValue]];
            bottomStr = [NSString stringWithFormat:@"%d °C",[roundBottom intValue]];
            
        }
        
        
        [m_lblTemp setText:[NSString stringWithFormat:@"SURF %@ | BOTTOM %@",surfStr,bottomStr]];
        
        frame.origin.y = CGRectGetMaxY(frame);
        
        rightFrame.size.height = CGRectGetMaxY(m_viewTempBox.frame);
        
        
    } else {
        
        [m_viewTempBox setHidden:YES];

    }
    
    [m_viewDiveTypeBox setFrame:frame];
    
    
    if (m_DiveInformation.diveType && m_DiveInformation.diveType.count > 0) {
        
        [m_viewDiveTypeBox setHidden:NO];

        NSString* strDiveType = @"";
        
        if (m_DiveInformation.diveType && m_DiveInformation.diveType.count > 0) {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            
            for (NSString* diveType in m_DiveInformation.diveType) {
                
                [arr addObject:[diveType capitalizedString]];
                
            }
            
            strDiveType = [arr componentsJoinedByString:@", "];
            
        }
        
        
        

        float width = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? 274.0f : 150.0f;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {  // iPad
            
            width = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? 492.0f : 364.0f;
            
        }
        
        CGSize sizeText = [strDiveType sizeWithFont:[UIFont fontWithName:kDefaultFontName size:10]
                                      constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                                          lineBreakMode:NSLineBreakByWordWrapping];
        
        frame = m_lblDiveType.frame;
        frame.size = sizeText;
        
        if (frame.size.height < 15) {
            
            frame.size.height = 15;
            
        }
        [m_lblDiveType setFrame:frame];
        
        [m_lblDiveType setText:strDiveType];
        
        CGRect tempFrame = m_viewDiveTypeBox.frame;
        tempFrame.size.height = CGRectGetMaxY(m_lblDiveType.frame);
        
        [m_viewDiveTypeBox setFrame:tempFrame];

        rightFrame.size.height = CGRectGetMaxY(m_viewDiveTypeBox.frame);

        
    } else {
        
        [m_viewDiveTypeBox setHidden:YES];
        
    }
    
    
    
    [m_viewDateBox.superview setFrame:leftFrame];
    [m_viewDurationBox.superview setFrame:rightFrame];

    float maxHeight = leftFrame.size.height;
    
    if (rightFrame.size.height > maxHeight ) {
        maxHeight = rightFrame.size.height;
    }
    
    frame = self.frame;
    
    frame.size.height = maxHeight +10;
    
    [self setFrame:frame];
    
    
}

@end
