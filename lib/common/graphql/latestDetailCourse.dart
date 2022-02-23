// {
// "dirId":"6200ee0472011f6f25bc83cb",
// "courseId":"6200f8a4c9e9c3609aa7045e"
// }

const String gqlDetailCourseList = r'''
query DetailCourse($dirId: String!, $courseId: String!) {
  detailCourse(dirId:$dirId, courseId: $courseId) {
    subCourses {
      subTitle
      courseId
      mainCourseId
    }
    _id
    title
    classTags
    description
    author
    authorTags
    category
    videoUrl
    imgUrl
    mainCourseId
    duration
    onlineTime
    addTime
    updateTime
  }
}

''';
