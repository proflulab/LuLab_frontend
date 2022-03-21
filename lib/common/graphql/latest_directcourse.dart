// {
//   "mode":"1",
//   "authorId": "61d9604f5fcd295d1b6893cf",
//   "limit": 10,
//   "skip": 0
// }

const String gqllatestDirectCourseList = r'''
query LatestDirectCourse($mode: String! , $authorId: String!,$limit:Int,$skip:Int!){
  latestDirectCourse(mode:$mode,authorId:$authorId,option:{limit:$limit,skip:$skip}) {
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
