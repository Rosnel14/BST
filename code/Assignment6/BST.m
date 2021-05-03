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

-(int)size{
    int count = 0;
    return [self sizeHelper:self.root count:count];
}

-(int)sizeHelper:(ListNode *)node count:(int)count{
    
    if(node == nil){
        return count;
    }
    else {
        count++;
        return [self sizeHelper:node.left count:count] + [self sizeHelper:node.right count:count];
    }
    
}

-(void)postorder{
    [self postoderHelper:self.root];
}

-(void)postoderHelper:(ListNode *)node{
    
    if(node == nil){
        return;
    }
    
    //go through branches first
    [self postoderHelper:node.left];
    [self postoderHelper:node.right];
    
    //print obj
    NSLog(@"%i",node.object);
}

//print objects in preorder
-(void)preorder{
    [self preorderHelper:self.root];
}

-(void)preorderHelper:(ListNode *)node{
    
    if(node == nil){
        return;
    }
    
    //first print int
    NSLog(@"%i",node.object);
    
    //recur on both branches
    [self preorderHelper:node.right];
    
    [self preorderHelper:node.left];
}

//print objects based on level they are in
-(void)levelorder{
    int height = [self height];
    for(int i=1;i<height;i++){
        [self levelOderHelper:self.root level:i];
    }
}

-(void)levelOderHelper:(ListNode *)current level:(int)level{
    
    if(current == nil){
        return;
    }
    if(level ==1){
        NSLog(@"%i",current.object);
    } else if (level > 1) {
        [self levelOderHelper:current.left level:level-1];
        [self levelOderHelper:current.right level:level-1];
    }
}


//levels of the BST
-(int)height{
    return [self heightHelper:self.root];
}

-(int)heightHelper: (ListNode *)current{
    if (self.root == nil){
        return 0;
    }
    else {
        int left_height= [self heightHelper:current.left];
        int right_height = [self heightHelper:current.right];
        
        if(left_height > right_height) {
            return left_height+1;
        } else {
            return right_height+1;
        }
    }
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

//contains
-(bool)contains:(int)key{
    if(self.root == nil){ // if tree is empty, doesn't contain anything
        return false;
    }
    return [self recurContains:key Node:self.root];
}

-(bool)recurContains:(int)key Node:(ListNode *)node{
    
    //base case
    if(node == nil){
        return false;
    }
    if(node.object == key){
        return true;
    }
    
    //step case
    if(key < node.object){
        return [self recurContains:key Node:node.left];
    }
    return [self recurContains:key Node:node.right];
}

//put method
// if tree is empty, new node becomes root
// recursively go to left or right depending on the key value(less or greater)
//if the node we have traversed to is nil, add node there
-(void)put:(int)Key{
    
    if(self.root == nil){
        self.root = [[ListNode alloc] initWithObject:Key];
    } else {
        [self recurPut:Key node:self.root];
    }
}

-(void)recurPut:(int)key node:(ListNode *)node{
    
    if(node.object > key){
        if(node.left == nil){
            node.left = [[ListNode alloc] initWithObject:key];
        } else {
            [self recurPut:key node:node.left];
        }
    } else if (node.object < key){
        if (node.right == nil){
            node.right = [[ListNode alloc] initWithObject:key];
        } else {
            [self recurPut:key node:node.right];
        }
    }
}

//inorder traversal
-(void)inorder{
    [self inorderHelper:self.root];
}

-(void)inorderHelper:(ListNode *)node{
    if(node != nil){
        [self inorderHelper:node.left];
        NSLog(@"%i",node.object);
        [self inorderHelper:node.right];
    }
}

//min value in subtree
-(ListNode *) getMinKey: (ListNode *) current{
    while (current.left != nil){
        current = current.left;
    }
    return current;
}

//done, but unsure if it works completely
-(void)Delete:(int)Key{
    ListNode * deletedNode = [[ListNode alloc] init];
    deletedNode = [self deleteHelper:Key node:self.root];
}

-(ListNode *)deleteHelper:(int)key node:(ListNode *)node{
    
    //base case, tree is empty
    if(node == nil) return node;
    
    //step case
    if (key < node.object){
        node.left = [self deleteHelper:key node:node.left];
    } else if (key > node.object){
        node.right = [self deleteHelper:key node:node.right];
    }
    
    //if key is the root's
    // then we have to account for deletion of the root
    
    else{
        if(node.left == nil){
            return node.right;
        } else if(node.right == nil){
            return node.left;
        }
        
        //node with two children case get smallest in the right subtree
        node.object = [self min];
        
        //delete afterwards
        node.right = [self deleteHelper:key node:node.right];
    }
    return node;
}






@end
