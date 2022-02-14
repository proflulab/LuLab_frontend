const String gqlLatestCommentList = r'''
query LatestComment($courseId: String!){
  latestComment(courseId:$courseId,option:{limit:5,skip:0}){
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
