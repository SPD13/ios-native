//
//  DiveEditNotesViewController.h
//  Diveboard
//
//  Created by VladimirKonstantinov on 9/17/14.
//  Copyright (c) 2014 threek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiveInformation;

@interface DiveEditNotesViewController : UIViewController <UITextViewDelegate>
{
    IBOutlet UITextView* m_txtDiveNote;
    
}

- (id)initWithDiveData:(DiveInformation *)diveInfo;
@end