// {
//   "courseId":6219874d916b276883e04f6f
// }

const String gqlDetailMainCourseList = r'''
query DetailMainCourse($courseId: String!) {
  detailMainCourse(courseId: $courseId) {
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
    coverUrl
    firstCourseId
    duration
    onlineTime
  }
}

''';
