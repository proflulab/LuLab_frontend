const String GQL_COURSE_LIST =
    r'''
  query{
  latestCourse (option:{limit:1,skip:1}){
    _id
    title
    classTags
    description
    author
    authorTags
    category
    mode
    videoUrl
    duration
  }
}
''';
