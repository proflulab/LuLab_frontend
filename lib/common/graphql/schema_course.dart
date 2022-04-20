class SchemaCourse {
  //获取课程分类
  static const String gqlCourseClassificationList = r'''
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

  //全部主课程数据请求
  static const String gqlmainCourseList = r'''
  query MainCourse {
    latestMainCourse(option: {limit: 100, skip: 0}) {
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

  //小节课程数据请求
  static const String gqlCourseList = r'''
  query allcourse {
    latestCourse(option: {limit: 14, skip: 0}) {
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

  //分类数据查询，mode代表课程类别；1为大咖访谈，2为预约课程，3为理论课程
  //请求参考：
  // {"mode":"1","authorId": "61d9604f5fcd295d1b6893cf","limit": 10,"skip": 0}
  static const String gqllatestDirectCourseList = r'''
  query LatestDirectCourse($mode: String! , $authorId: String!,$limit:Int,$skip:Int!){
    latestDirectCourse(mode:$mode,authorId:$authorId,option:{limit:$limit,skip:$skip}) {
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
      coverUrl
      firstCourseId
      duration
      status
    }
  }
  ''';

  //查询主课下每小节信息
  // {"dirId":"6200ee0472011f6f25bc83cb","courseId":"6200ee0472011f6f25bc83cb"}
  static const String gqlDetailCourseList = r'''
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

  //单课查询
  //  {"courseId":"6219874d916b276883e04f6f"}
  //
  static const String gqlDetailMainCourseList = r'''
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

  //单课查询
  //  { "dirId":"6200ee0472011f6f25bc83cb"}

  static const String gqldetailsCourseList = r'''
  query detailCourse ($dirId: String!){
    detailCourse(dirId: $dirId) {
      _id
      title
      dirTitle
      classTags
      description
      author
      authorTags
      category
      mode
      videoUrl
      imgUrl
      sort
      mainCourseId
      duration
      onlineTime
      addTime
      updateTime
    }
  }

''';
}
