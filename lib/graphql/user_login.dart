// 参数

// {
//   "name": "da",
//   "password": "1"
// }

const String GQL_USER_LOGIN = r'''

query UserLogin($name: String!, $password: String!) {
  userLogin(userInput: {name: $name, password: $password}) {
    status
    msg
    data {
      name
      password
      img
      wechat
      phone
      sex
      description
    }
  }
}


''';
