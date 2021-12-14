// 参数

const String GQL_SOURSE_INFROR = r'''

query latestInformation {
  latestInformation(option: {limit: 1, skip: 1}) {
    title
    content
  }
}


''';
