// {
//   "dirId":"62345d7be311a5451190def0",
//   "courseId":"62345c54e311a5451190deef"
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
