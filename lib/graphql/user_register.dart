// 参数

// {
//   "name": "1111111",
//   "password": "1111111",
//   "ensurePassword": "1111111"
// }

const String GQL_USER_REGISTER =
    r'''

  query UserLogin($name: String!, $password: String!,$ensurePassword: String!) {
  userRigister(userInput:{name:$name,password:$password,ensurePassword:$ensurePassword}){
    msg
    status
  }
}

''';
