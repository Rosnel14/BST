//
//  ViewController.m
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#import "ViewController.h"
#import "QuestionNode.h"
#import "QuestionTree.h"
#import <Foundation/Foundation.h>

@implementation ViewController
{
    NSString * userTextResponse;
    BOOL yesOrNo; //true is yes, false is no
    QuestionTree * gameTree;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    userTextResponse = nil;
    yesOrNo = false;
    [_DisplayField setText:@"Please think of an object for me to guess."];
}

-(void)viewDidAppear:(BOOL)animated{
    //[NSThread sleepForTimeInterval:2.0f]; //using this for pausing the app
}


-(IBAction)enterResponseButton:(id)sender {
    userTextResponse = _UserInputField.text;
    gameTree = [[QuestionTree alloc] init];
    if([self isAnswerNode:gameTree.root]){
        [_DisplayField setText:[NSString stringWithFormat:@" %@ %@ %@",@"Is your object:  ",gameTree.root.text,@"?"]];
    } else {
        [_DisplayField setText:gameTree.root.text];
    }
}
-(IBAction)startGame:(id)sender {
    
    if([self isAnswerNode:gameTree.root]){
        if(yesOrNo == true){
            [_DisplayField setText:@"I win!"];
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"I Lose"
                                       message:@"Tell me the object, a question to distinguish it, and if the answer is y/n?"
                                       preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];

            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            [NSThread sleepForTimeInterval:2.0f];
            [_DisplayField setText:@"O bject, question, and answer (y/n)?"];
        }
    }else {
        if(yesOrNo == true){
            gameTree.root = gameTree.root.yes;
        } else {
            gameTree.root = gameTree.root.no;
        }
    }
}
- (IBAction)learnNewObject:(id)sender {
    if(yesOrNo == true){
        QuestionNode * yesNew = [[QuestionNode alloc] initWithText:_userNewObjectField.text];
        gameTree.root.yes = [[QuestionNode alloc] initWithFull:_userNewQuestionField.text yesNode:yesNew noNode:gameTree.root];
    } else {
        QuestionNode * noNew = [[QuestionNode alloc] initWithText:_userNewObjectField.text];
        gameTree.root.no = [[QuestionNode alloc] initWithFull:_userNewQuestionField.text yesNode:noNew noNode:gameTree.root];
    }
}

- (IBAction)yOrNButtonHolder:(id)sender {
    if([_yOrNbox.text isEqualToString:@"y"]){
        yesOrNo = true;
    } else if([_yOrNbox.text isEqualToString:@"n"]){
        yesOrNo = false;
    }
}



-(BOOL)isAnswerNode: (QuestionNode *)node{
    return (node.yes == nil || node.no == nil);
}


@end
