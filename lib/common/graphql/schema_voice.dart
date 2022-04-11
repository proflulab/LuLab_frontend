//参数
// {
// "userId":"shiming",
// "queryText":"你好"
// }

const String voice = r'''

query vioce($userId: String!,$queryText:String!){
  speechGoogle(speechRequest:{userId:$userId,queryText:$queryText})
  {
    msg
    code
    category
    detail
    subBreak
    fields
  }
}


''';
