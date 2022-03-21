// {
//    "mode":"3",
//    "authorId": "61d9604f5fcd295d1b6893cf"
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
    videoUrl
    onlineTime
    imgUrl
    firstCourseId
    duration
    status
  }
}
''';
