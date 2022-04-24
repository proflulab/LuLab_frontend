class SchemaComment {
  //添加课程评论
  //数据案例
  //{"content": "test","entityId": "6200f8a4c9e9c3609aa7045e","category": "2","authorName": "黄肖山","authorId": "623ea8486be88159e55f46c1","authorImg": "https://gitee.com/shimingy/imagesbed/raw/master/img/%E5%8D%A0%E4%BD%8D%E5%9B%BE2.jpg"}
  static const String gqlCommentAddList = r'''
  mutation commentAdd ($content: String!, $entityId: String!, $category: String!, $authorName: String!,$authorId: String!,$authorImg:String!){
    commentAdd(commentInput: {content: $content, entityId: $entityId, category:  $category, authorName:$authorName, authorId: $authorId, authorImg: $authorImg}) {
      status
      msg
    }
  }

''';

  //请求课程评论
  //数据案例

  //{"entityId": "6200f8a4c9e9c3609aa7045e","category": "2","limit": 0,"skip": 0}

  static const String gqlLatestCommentList = r'''
query Comment  ( $entityId: String!, $category: String!, $skip: Int!,$limit: Int!){
  latestComment( entityId: $entityId, category: $category,option: {skip: $skip, limit: $limit}) {
    _id
    content
    entityId
    parentCommentId
    authorName
    authorId
    authorImg
    category
    addTime
    timestamp
  }
}

''';
}
