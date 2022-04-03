class SchemaUser {
//用户登录
//请求数据参考
//{"name": "shiming","password": "12345678"}
  static const String gqlUserLogin = r'''
query UserLogin($name: String!, $password: String!) {
  userLogin(userInput: {name: $name, password: $password}) {
    status
    msg
    data {
      _id
      name
      age
      sex
      industry
      phone
      email
      wechat
      description
      iconUrl
      password
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
// {
//   "name": "news",
//   "password": "12345678",
//   "sex":"1",
//   "img": "http://img.wxcha.com/m00/f0/f5/5e3999ad5a8d62188ac5ba8ca32e058f.jpg",
//   "description": "hello",
//   "wechat": "shiming",
//   "phone": "234532632"
// }

  static const String gqlUserUpdata = r'''
mutation userUpdate($name: String!, $password: String!, $sex: String!, $img: String!, $description: String!, $wechat: String!, $phone: String!) {
  userUpdate(userInput: {name: $name, password: $password, sex: $sex, img: $img, description: $description, wechat: $wechat, phone: $phone}) {
    msg
    status
  }
}


''';
}
