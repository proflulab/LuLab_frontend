// 参数

// {
//   "name": "news",
//   "password": "12345648",
//   "sex":"1",
//   "img": "http://img.wxcha.com/m00/f0/f5/5e3999ad5a8d62188ac5ba8ca32e058f.jpg",
//   "description": "hello"
// }

const String GQL_USER_UPDATE = r'''

mutation userUpdate($name: String!, $password: String!, $sex: String!, $img: String!, $description: String!) {
  userUpdate(userInput: {name: $name, password: $password, sex: $sex, img: $img, description: $description}) {
    msg
    status
  }
}


''';
