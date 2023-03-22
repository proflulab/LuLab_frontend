class SchemaCourse {
  ///课程分类courseCategory
  static const String gqlCourseCategory = r'''
query courseCategory{
  courseCategory{
    _id
    title
  }
}
''';

  ///课程列表查询course
  ///请求参考：
  /// {"category_id": "63c4d7e691dc5226f0a9fe83","page": 1,"limit": 10}
  static const String gqlCourse = r'''
query course ($category_id: String!, $page: Int, $limit: Int) {
    course (category_id: $category_id, page: $page, limit: $limit) {
        _id
        title
        imageUrl
        author
        description
        classTags
        authorTags
        onlineTime
        addTime
        updateTime
    }
}
''';

//   ///课程详情查询courseDetail
//   ///请求参考：
//   /// {"id":"d1cid2o13own424"}
//   static const String gqlCourseDetail = r'''
// query courseDetail($course_id:String!){
//   courseDetail(course_id:$course_id){
//     _id
//     title
//     classTags
//     imageUrl
//     author
//     authorTags
//     description
//     onlineTime
//     addTime
//     updateTime
//   }
// }
// ''';
  ///课程目录查询courseCatalogue
  ///请求参考：
  /// {"courseId":"ni12a2hbc332hai3da3ia1213"}
  static const String gqlCourseCatalogue = r'''
 query courseCatalogue($course_id:String!){
  courseCatalogue(course_id:$course_id){
    _id
    title
    duration
    free
  }
}
''';
  ///课程链接courseLink
  ///请求参考：
  /// {"detail_id":"123456"}
  static const String gqlCourseLink = r'''
query courseLink($detail_id:String!){
  courseLink(detail_id:$detail_id){
    link
  }
}
''';


//   //全部主课程数据请求
//   static const String gqlmainCourseList = r'''
//   query MainCourse {
//     latestMainCourse(option: {limit: 100, skip: 0}) {
//       _id
//       title
//       classTags
//       description
//       author
//       authorTags
//       category
//       mode
//       videoUrl
//       imgUrl
//       firstCourseId
//       duration
//     }
//   }
// ''';
//
//   //小节课程数据请求
//   static const String gqlCourseList = r'''
//   query allcourse {
//     latestCourse(option: {limit: 14, skip: 0}) {
//       _id
//       title
//       classTags
//       description
//       author
//       authorTags
//       category
//       mode
//       videoUrl
//       duration
//     }
//   }
// ''';
//
//   //查询主课下每小节信息
//   // {"dirId":"6200ee0472011f6f25bc83cb","courseId":"6200ee0472011f6f25bc83cb"}
//   static const String gqlDetailCourseList = r'''
//   query DetailCourse($dirId: String!, $courseId: String!) {
//     detailCourse(dirId:$dirId, courseId: $courseId) {
//       subCourses {
//         subTitle
//         courseId
//         mainCourseId
//       }
//       _id
//       title
//       classTags
//       description
//       author
//       authorTags
//       category
//       videoUrl
//       imgUrl
//       mainCourseId
//       duration
//       onlineTime
//       addTime
//       updateTime
//     }
//   }
//
// ''';
//
//   //单课查询
//   //  {"courseId":"6219874d916b276883e04f6f"}
//   //
//   static const String gqlDetailMainCourseList = r'''
//   query DetailMainCourse($courseId: String!) {
//     detailMainCourse(courseId: $courseId) {
//       _id
//       title
//       classTags
//       description
//       author
//       authorTags
//       category
//       mode
//       videoUrl
//       imgUrl
//       coverUrl
//       firstCourseId
//       duration
//       onlineTime
//     }
//   }
//
// ''';
//
//   //单课查询
//   //  { "dirId":"6200ee0472011f6f25bc83cb"}
//
//   static const String gqldetailsCourseList = r'''
//   query detailCourse ($dirId: String!){
//     detailCourse(dirId: $dirId) {
//       _id
//       title
//       dirTitle
//       classTags
//       description
//       author
//       authorTags
//       category
//       mode
//       videoUrl
//       imgUrl
//       sort
//       mainCourseId
//       duration
//       onlineTime
//       addTime
//       updateTime
//     }
//   }
//
// ''';
}
