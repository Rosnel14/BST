//
//  QuestionNode.h
//  Questions21App
//
//  Created by Rosnel Leyva-Cortés on 5/6/21.
//

#ifndef QuestionNode_h
#define QuestionNode_h

@interface QuestionNode : NSObject

@property (nonatomic) NSString * text;


//right is yes, left is no
@property QuestionNode * yes;

@property QuestionNode * no;

-(instancetype)init;

-(instancetype)initWithText:(NSString *)textObj;

-(BOOL)isQuestion;

-(void)traverse;
@end

#endif /* QuestionNode_h */
