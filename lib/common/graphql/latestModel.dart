//功勋员数据请求
const String gqlModelList = r'''
query{
  latestModel(option:{limit:1,skip:0}) {
    _id
    name
    description
    identity
    imgUrl
    videoUrl
    growthDescription
    timestamp
  }
}

''';