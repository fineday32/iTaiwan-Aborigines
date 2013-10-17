//
//  wantToPlayViewController.m
//  iTaiwan Aborigines
//
//  Created by Thomas on 13/10/16.
//  Copyright (c) 2013年 Thomas Hsu. All rights reserved.
//

#import "wantToPlayViewController.h"

@interface wantToPlayViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playButtonOutlet1;
@property (weak, nonatomic) IBOutlet UIButton *playButtonOutlet2;
@property (weak, nonatomic) IBOutlet UIButton *playButtonOutlet3;
@property (weak, nonatomic) IBOutlet UIButton *playButtonOutlet4;
- (IBAction)playButton:(id)sender;

@end

@implementation wantToPlayViewController

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
    [self setTitle:@"想 玩"];

    [_playButtonOutlet1 setTitle:@"旅遊路線" forState:UIControlStateNormal];
    [_playButtonOutlet2 setTitle:@"溫泉" forState:UIControlStateNormal];
    [_playButtonOutlet3 setTitle:@"民宿" forState:UIControlStateNormal];
    [_playButtonOutlet4 setTitle:@"原住民樂團 / 民間團體" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButton:(id)sender
{
    
}
@end
