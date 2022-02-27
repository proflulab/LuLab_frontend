//直播课程数据请求
const String gqlLiveList = r'''
 query{
  latestDirectCourse(mode:"2",option:{limit:2,skip:0}) {
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
