class SchemaComment {
  //添加课程评论
  //数据案例
  // {
  //   "content": "nihao",
  //   "authorId": "test",
  //   "authorImg": "test",
  //   "courseId": "619cb9c3ee78eb0f41329627",
  //   "authorName": "test"
  // }
  static const String gqlCommentAddList = r'''
  mutation CommentAdd($content: String!, $authorId: String!, $authorImg: String!, $courseId: String!, $authorName: String!) {
    commentAdd(commentInput: {content: $content, authorId: $authorId, authorImg: $authorImg, courseId: $courseId, authorName: $authorName}) {
      status
      msg
    }
  }

''';

  //请求课程评论
  //数据案例
  // {
  //   "courseId": "623d9be5975907b016b3e5ea"
  // }
  static const String gqlLatestCommentList = r'''
query LatestComment($courseId: String!) {
  latestComment(courseId: $courseId, option: {limit: 500, skip: 0}) {
    _id
    content
    courseId
    authorName
    authorId
    authorImg
    category
    addTime
  }
}

''';
}
