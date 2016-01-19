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
    NSLog(@"save");
}

- (BOOL)textFieldShouldReturn:(UITextField *) textField  {
    
    if ([textField isEqual:self.textField]) {
        [self.textField resignFirstResponder];
    }
    
    return YES;
}



@end
