//课程详情数据请求
const String gqlmainCourseList = r'''
  query{
  latestMainCourse(option:{limit:5,skip:0}) {
    _id
    title
    classTags
    description
    author
    authorTags
    category
    mode
    videoUrl
    imgUrl
    firstCourseId
    duration
  }
}
''';
