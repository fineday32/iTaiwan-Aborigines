//
//  rewardPopupViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/16.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "rewardPopupViewController.h"

@interface rewardPopupViewController ()
@property (weak, nonatomic) IBOutlet UIButton *popviewButtonOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *popviewButtonOutlet2;

@end

@implementation rewardPopupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIToolbar *toolbarBackground = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 44, 220, 180)];
    [self.view addSubview:toolbarBackground];
    [self.view sendSubviewToBack:toolbarBackground];
    
    _popviewTitle.text = @"是獎勵耶  恭喜恭喜";
    _popviewOutlet.text = @"我 想 要";
    [_popviewButtonOutlet1 setTitle:@"精美照片" forState:UIControlStateNormal];
    [_popviewButtonOutlet2 setTitle:@"紀念影片" forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
