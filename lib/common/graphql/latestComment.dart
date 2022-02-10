const String gqlLatestCommentList = r'''
query LatestComment($courseId: String!){
  latestComment(courseId:$courseId,option:{limit:5,skip:0}){
   content
   authorImg
   authorId
  }
}

''';
