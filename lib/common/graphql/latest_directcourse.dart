// {
//   "mode":1
// }

const String gqllatestDirectCourseList = r'''
query LatestDirectCourse($mode: String! , $authorId: String!){
  latestDirectCourse(mode:$mode,authorId:$authorId,option:{limit:2,skip:0}) {
    _id
    title
    classTags
    description
    author
    authorTags
    category
    mode
   category
    videoUrl
    onlineTime
    imgUrl
    firstCourseId
    duration
    status
  }
}
''';
