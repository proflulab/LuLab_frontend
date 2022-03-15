const String gqlRecordAddList = r'''
mutation RecordAdd($courseId:String!, $authorId:String!, $status:String!, $onlineTime:String!){
  recordAdd(orderRecordInput:{courseId:$courseId, authorId:$authorId, status:$status, onlineTime:$onlineTime}){
    status
    msg
  }
}

''';

// {
//   "courseId": "6219874d916b276883e04f6f",
//   "authorId": "61da3c75bc88025d1d517492",
//   "status": "1",
//   "onlineTime": "2022-10-20 10:10:10",
// }
