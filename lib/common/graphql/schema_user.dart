class SchemaUser {
//用户登录
//请求数据参考
//{"name": "shiming","password": "12345678"}
  static const String gqlUserLogin = r'''
query UserLogin($name: String!, $password: String!) {
  userLogin(userInput: {name: $name, password: $password}) {
    status
    msg
    token
    data {
      _id
      name
      sex
      password
      birth
      position
      industry
      phone
      email
      wechat
      detailMsg
      description
      duration
      userType
      identity
      imgUrl
      iconUrl
      bigCoverUrl
      profileImgUrl
      videoUrl
    }
  }
}
''';

//用户注册
//请求数据参考
//{"name": "1111111","password": "1111111","ensurePassword": "1111111"}
  static const String gqlUserRegister = r'''
  mutation UserLogin($name: String!, $password: String!, $ensurePassword: String!) {
  userRigister(userInput: {name: $name, password: $password, ensurePassword: $ensurePassword}) {
    msg
    status
  }
}

''';

//用户数据修改
//请求数据参考
//{"_id":"61d9604f5fcd295d1b6893cf","name": "shiming","sex":"1","description": "hello","wechat": "shiming4325","phone": "234532632"}

  static const String gqlUserUpdata = r'''
mutation userUpdate($_id: String!, $name: String!, $sex: String!, $description: String!, $wechat: String!, $phone: String!) {
  userUpdate(userInput: {_id: $_id, name: $name, sex: $sex, description: $description, wechat: $wechat, phone: $phone}) {
    msg
    status
  }
}



''';

// {"_id":"61d9604f5fcd295d1b6893cf","name": "shiming","sex":"1","description": "hello","wechat": "shiming4325","phone": "234532632"}
// mutation userUpdate($_id: String!, $name: String!, $sex: String!, $description: String!, $wechat: String!, $phone: String!) {
//   userUpdate(userInput: {_id: $_id, name: $name, sex: $sex, description: $description, wechat: $wechat, phone: $phone}) {
//     msg
//     status
//   }
// }

  /// 用户一键登录
  /// {"token": "shiming","accessToken": "1234567"}
  static const String gqlUserQuickLogin = r'''
query ($token: String!, $accessToken: String!){
  mobileLogin(userCheck:{token:$token,accessToken:$accessToken}) {
    msg
    token
    status
    data {
      _id
      name
      account
      sex
      birth
      position
      company
      industry
      phone
      email
      wechat
      schoolRecord
      workCondition
      detailMsg
      description
      duration
      category
      userType
      identity
      imgUrl
      iconUrl
      bigCoverUrl
      profileImgUrl
      videoUrl
      country
      address
      addTime
      timestamp
    }
  }
}
''';
}
