// 参数

const String gqlSourseInfror = r'''

query latestInformation {
  latestInformation(option: {limit: 1, skip: 1}) {
    title
    content
  }
}


''';
