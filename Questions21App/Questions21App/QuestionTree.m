//
//  QuestionTree.m
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#import <Foundation/Foundation.h>
#import "QuestionTree.h"

@implementation QuestionTree

//start with one answer node already, so initial guess is computer
-(instancetype)init{
    if(self){
        self = [super init];
        self.root = [[QuestionNode alloc] initWithFull:@"computer" yesNode:nil noNode:nil];
    }
    return self;
}



//levels of the BST
-(int)height{
    return [self heightHelper:self.root];
}

-(int)heightHelper: (QuestionNode *)current{
    if (self.root == nil){
        return 0;
    }
    else {
        int left_height= [self heightHelper:current.yes];
        int right_height = [self heightHelper:current.no];
        
        if(left_height > right_height) {
            return left_height+1;
        } else {
            return right_height+1;
        }
    }
}


//inorder traversal
-(void)inorder{
    [self inorderHelper:self.root];
}

-(void)inorderHelper:(QuestionNode *)node{
    if(node != nil){
        [self inorderHelper:node.yes];
        NSLog(@"%@",node.text);
        [self inorderHelper:node.no];
    }
}

-(int)size{
    int count = 0;
    return [self sizeHelper:self.root count:count];
}

-(int)sizeHelper:(QuestionNode *)node count:(int)count{
    
    if(node == nil){
        return count;
    }
    else {
        count++;
        return [self sizeHelper:node.yes count:count] + [self sizeHelper:node.no count:count];
    }
    
}


@end
