//
//  mainViewController.h
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/15.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *mapImage;
@property (weak, nonatomic) IBOutlet UIImageView *cameraImage;

//@property(nonatomic, retain) UITableView *tableView;

@end
