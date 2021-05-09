//
//  ViewController.m
//  Assignment6
//
//  Created by Rosnel Leyva-Cortés on 4/29/21.
//

#import "ViewController.h"
#import "BST.h"

@implementation ViewController
{
    BST * myTree;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    myTree = [[BST alloc] initWithRoot:4];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)getSize:(id)sender {
    NSString * str = [NSString stringWithFormat:@"%i",[myTree size]];
    [_sizeField setPlaceholderString:str];
}
- (IBAction)getContains:(id)sender {
    int userIn = [[_containsField stringValue] intValue];
    [_containslabel setStringValue:[NSString stringWithFormat:@"%i",[myTree contains:userIn]]];
    //0 is false, 1 means true, there isn't a valid string data formatter
}
- (IBAction)getHeight:(id)sender {
    int height = [myTree height];
    [_heightField setStringValue:[NSString stringWithFormat:@"%i",height]];
}

- (IBAction)getMax:(id)sender {
    int max = [myTree max];
    [_MaxField setStringValue:[NSString stringWithFormat:@"%i",max]];
}
- (IBAction)getMin:(id)sender {
    int min = [myTree min];
    [_MaxField setStringValue:[NSString stringWithFormat:@"%i",min]];
}
- (IBAction)getDelete:(id)sender {
    int userIn = [[_deleteField stringValue] intValue];
    [myTree Delete:userIn];
}
- (IBAction)getIsEmpty:(id)sender {
    [_isEmptyField setStringValue:[NSString stringWithFormat:@"%i",[myTree isEmpty]]];
    //again, 0 false, 1 true
}
- (IBAction)getInsert:(id)sender {
    int userIn = [[_insertField stringValue] intValue];
    [myTree put:userIn];
}

//these methods just print to the command line
- (IBAction)printInorder:(id)sender {
    [myTree inorder];
}
- (IBAction)printPostorder:(id)sender {
    [myTree postorder];
}
- (IBAction)printPreorder:(id)sender {
    [myTree preorder];
}
- (IBAction)printlevelorder:(id)sender {
    [myTree levelorder];
}


@end
