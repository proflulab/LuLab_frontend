class SchemaHome {
  //添加预约
  // {"courseId": "6219874d916b276883e04f6f","authorId": "61da3c75bc88025d1d517492","status": "1","onlineTime": "2022-10-20 10:10:10" }
  static const String gqlRecordAddList = r'''
mutation RecordAdd($courseId:String!, $authorId:String!, $status:String!, $onlineTime:String!){
  recordAdd(orderRecordInput:{courseId:$courseId, authorId:$authorId, status:$status, onlineTime:$onlineTime}){
    status
    msg
  }
}

''';

//课程预约查询
// {"courseId": "6219874d916b276883e04f6f","authorId": "61d9604f5fcd295d1b6893cf"}

  static const String gqlLatestUserCourseRecordList = r'''
query LatestUserCourseRecord($authorId:String!, $courseId:String!){
  latestUserCourseRecord(authorId:$authorId, courseId:$courseId){
    status
    msg
  }
}

''';

  //所有预约查询
  //  { "authorId":"61d9604f5fcd295d1b6893cf","limit": 0,"skip": 0}

  static const String gqlLatestRecordList = r'''
  query LatestRecord($authorId: String!,$limit:Int!,$skip:Int!){
    latestRecord(authorId:$authorId,option:{limit:$limit,skip:$skip}) {
      courseId
      authorId
      status
      addTime
      onlineTime
      timestamp
      imgUrl
      title
      author
      description
      backgroundUrl
      coverUrl
    }
  }
''';

  //功勋员数据请求
  //{"category": "2","skip": 0,"limit": 0}
  static const String gqlModelList = r'''
query feats($category: String!, $skip: Int!, $limit: Int!) {
  latestClassificationUser(category: $category, option: {skip: $skip, limit: $limit}) {
    _id
    name
    birth
    sex
    phone
    email
    wechat
    homeTown
    location
    detailMsg
    description
    profileImgUrl
    bigCoverUrl
    videoUrl
    tags
    category
    userType
  }
}
''';

  //功勋员经历数据请求
  //{ "userId":"624e90a7b2cc58a87ff8432c","limit": 0,"skip": 0}
  static const String featsExperience = r'''
query featsdetails($userId: String!,$limit:Int!,$skip:Int!){
  latestUserGrowth(userId:$userId,option:{limit:$limit,skip:$skip}) {
    company
    beginTime
    endTime
    position
    desc
    logoUrl
    type
  }
}
''';

  //训练营数据请求
  static const String gqlLatestTraining = r'''
query {
  latestTraining(option:{skip:0,limit:5}) {
   _id
   name
   description
   detailUrl
   imgUrl
   applyUrl
   trait
   addTime 
   timestamp 
  }
}
  ''';
}
