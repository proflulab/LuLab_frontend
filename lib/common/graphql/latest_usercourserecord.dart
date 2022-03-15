const String gqlLatestUserCourseRecordList = r'''
query LatestUserCourseRecord($authorId:String!, $courseId:String!){
  latestUserCourseRecord(authorId:$authorId, courseId:$courseId){
    status
    msg
  }
}

''';

// {
//   "courseId": "6219874d916b276883e04f6f",
//   "authorId": "61da3c75bc88025d1d517492"
// }
