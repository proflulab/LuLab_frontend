// {
//   "authorId":"test"
// }

const String gqlLatestRecordList = r'''
query LatestRecord($authorId: String!){
  latestRecord(authorId:$authorId,option:{limit:2,skip:0}) {
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
