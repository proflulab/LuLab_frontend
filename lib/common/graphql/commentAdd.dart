const String gqlCommentAddList = r'''
mutation CommentAdd($content: String!, $authorId: String!, $authorImg: String!, $courseId: String!, $authorName: String!){
  commentAdd(commentInput:{content:$content,authorId:$authorId,authorImg:$authorImg,courseId:$courseId,authorName:$authorName}){
    status
    msg
  }
}

''';

//{
//   "content": "nihao",
//   "authorId": "test",
//   "authorImg": "test",
//   "courseId": "619cb9c3ee78eb0f41329627",
//   "authorName": "test"
// }
