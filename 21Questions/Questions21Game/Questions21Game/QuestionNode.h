//
//  QuestionNode.h
//  Questions21Game
//
//  Created by hackIntosh on 5/5/21.
//

#ifndef QuestionNode_h
#define QuestionNode_h

@interface QuestionNode : NSObject

@property NSString * text;


//right is yes, left is no
@property QuestionNode * yes;

@property QuestionNode * no;

-(instancetype)init;

-(instancetype)initWithText:(NSString *)textObj;

-(BOOL)isQuestion;
@end

#endif /* QuestionNode_h */
