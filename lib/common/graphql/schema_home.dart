class SchemaHome {
  //添加预约
  // {
  //   "courseId": "6219874d916b276883e04f6f",
  //   "authorId": "61da3c75bc88025d1d517492",
  //   "status": "1",
  //   "onlineTime": "2022-10-20 10:10:10"
  // }
  static const String gqlRecordAddList = r'''
mutation RecordAdd($courseId:String!, $authorId:String!, $status:String!, $onlineTime:String!){
  recordAdd(orderRecordInput:{courseId:$courseId, authorId:$authorId, status:$status, onlineTime:$onlineTime}){
    status
    msg
  }
}

''';

//课程预约查询
// {
//   "courseId": "6219874d916b276883e04f6f",
//   "authorId": "61da3c75bc88025d1d517492"
// }

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
    age
    sex
    position
    industry
    country
    phone
    email
    wechat
    schoolRecord
    workCondition
    detailMsg
    description
    category
    userType
    identity
    imgUrl
    iconUrl
    bigCoverUrl
    password
    videos
    imgs
    docs
    growthDescriptions
    tags
  }
}
''';
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
