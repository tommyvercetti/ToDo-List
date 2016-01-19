//
//  ViewController.m
//  ToDo List
//
//  Created by Admin on 1/17/16.
//  Copyright © 2016 Andrian Kryk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker.minimumDate = [NSDate date];
    
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleEndEditing)];
    
    [self.view addGestureRecognizer:handleTap];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleEndEditing {
    
    [self.view endEditing:YES];
    
    //[self.textField resignFirstResponder];
}

- (void) datePickerValueChanged {
    
    self.eventDate = self.datePicker.date;
    
    
    NSLog(@"date Picker %@", self.datePicker.date);
}

- (void) save {
    
    NSString * eventInfo = self.textField.text;
    
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"HH:mm dd.MMMM.yyyy";
    
    NSString * eventDate = [formater stringFromDate:self.eventDate];
    
    NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys:
                           eventInfo, @"eventInfo",
                           eventDate, @"eventDate", nil];
    
    
    UILocalNotification * notofication = [[UILocalNotification alloc] init];
    notofication.userInfo = dict;
    notofication.timeZone = [NSTimeZone defaultTimeZone];
    notofication.fireDate = self.eventDate;
    notofication.alertBody = eventInfo;
    notofication.applicationIconBadgeNumber = 1;
    notofication.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notofication];
    
    
    
    
    
    
    
    NSLog(@"save");
}

- (BOOL)textFieldShouldReturn:(UITextField *) textField  {
    
    if ([textField isEqual:self.textField]) {
        [self.textField resignFirstResponder];
    }
    
    return YES;
}



@end
