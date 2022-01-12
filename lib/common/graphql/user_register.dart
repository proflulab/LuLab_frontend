// 参数

// {
//   "name": "1111111",
//   "password": "1111111",
//   "ensurePassword": "1111111"
// }

const String gqlUserRegister = r'''

  mutation UserLogin($name: String!, $password: String!, $ensurePassword: String!) {
  userRigister(userInput: {name: $name, password: $password, ensurePassword: $ensurePassword}) {
    msg
    status
  }
}

''';
