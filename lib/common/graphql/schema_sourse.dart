class SchemaSourse {
  //资讯信息请求
  //参数参考
  // {
  // "skip": 1,
  // "limit": 1
  // }
  static const String gqlSourseInfror = r'''

  query Information($skip: Int!, $limit: Int!) {
  latestInformation(option: {skip: $skip, limit: $limit}) {
    title
    introduction
    img
    author
    releaseDate
    content
    mdtext
    adv
    href
  }
}
  
  
  ''';
}
