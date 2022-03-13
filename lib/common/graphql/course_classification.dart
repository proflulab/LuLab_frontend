//课程数据请求
const String gqlCourseClassificationList = r'''
query{
  queryCourseClassification(option:{limit:5,skip:0}) {
    _id
    title
    mode
    addTime
    timestamp
  }
}
''';
