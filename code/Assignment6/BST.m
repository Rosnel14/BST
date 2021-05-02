//
//  BST.m
//  Assignment6
//
//  Created by Rosnel Leyva-Cortés on 4/29/21.
//

#import <Foundation/Foundation.h>
#import "BST.h"

@implementation BST

-(instancetype)initWithRoot: (int)rootObj{
    if(self){
        self = [super init];
        self.root = [[ListNode alloc] initWithObject:rootObj];
    }
    return self;
}

//start at root, and go left until a node doesn't have a left child. THat node is min
-(int)min{ //wrapper
    return [self recurMin:self.root];
}

-(int)recurMin:(ListNode *)node{
    
    //base case
    if (node == nil){
        return NO;
    }
    if (node.left == nil){
        return node.object;
    }
    return [self recurMin:node.left];
}
//end of find min


//start at root, go right until a node doesn't have a right child, has to be largest value
-(int)max{
    return [self recurMax:self.root];
}

-(int)recurMax:(ListNode *)node{
    
    //base case
    if (node == nil){
        return NO;
    }
    if(node.right == nil){
        return node.object;
    }
    return [self recurMax:node.right];
    
}
//end of max functions

//if no root, is empty
-(bool)isEmpty{
    if(self.root == nil){
        return false;
    } else{
        return true;
    }
}





//need to test this out first 
-(void)put: (int)Key{
    if(self.root == nil){ // base
        self.root = [[ListNode alloc] initWithObject:Key];
    } else if (Key > self.root.object){
        //recursion into right side
        [self putRecur:self.root.right value:Key];
    } else if (Key < self.root.object) {
        //recursion into left side
        [self putRecur:self.root.right value:Key];
    }
    
}

-(void)putRecur:(ListNode *)currentNode value:(int)Key{
    
    //base for right side insert
    if(currentNode.object < Key && currentNode.right == nil){
        currentNode.right =  [[ListNode alloc] initWithObject:Key];
        //base for left side insert
    } else  if(currentNode.object > Key && currentNode.left == nil){
        currentNode.left = [[ListNode alloc] initWithObject:Key];
    } else if (Key > currentNode.object){
        [self putRecur:currentNode.right value:Key];
    } else if (Key < currentNode.object) {
        [self putRecur:currentNode.left value:Key];
    } //got to keep checking until there is a possible insertable place
    
    
}

@end
