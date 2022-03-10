// {
//   "mode":1
// }

const String gqllatestDirectCourseList = r'''
query LatestDirectCourse($mode: String!){
  latestDirectCourse(mode:$mode,option:{limit:2,skip:0}) {
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
  }
}
''';
