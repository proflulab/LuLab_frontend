class SchemaUser {
///验证码发送
///请求数据参考
///{"mobile":"15110880530","area":86}
  static const String gqlVerifySend = r'''
query verifySend($mobile:String!,$area:Int!){
  verifySend(mobile: $mobile,area: $area){
    status
    msg
  }
}
''';
  ///验证码验证
  ///请求数据参考
  ///{"mobile":"15110880530","area":86,"code":"312113"}
  static const String gqlVerifyCheck = r'''
query verifyCheck ($mobile: String!, $code: String!, $area: Int!) {
    verifyCheck (mobile: $mobile, code: $code, area: $area) {
        status
        msg
    }
}
''';
///验证码登陆
///请求数据参考
///{"mobile":"15110880530","area":86,"code":"312113"}
  static const String gqlLoginCaptcha = r'''
query loginCaptcha ($mobile: String!, $area: Int!, $code: String!) {
    loginCaptcha (mobile: $mobile, area: $area, code: $code) {
        status
        msg
        token
        refresh_token
        data{
            username
            imageUrl
            sex
            wechat
            dsc
        }
    }
}
''';
  ///密码登录
///请求数据参考
///{"mobile":"15110880530","password":"1334213313"}
  static const String gqlLoginPassword = r'''
query loginPassword($mobile:String!,$password:String!){
  loginPassword(mobile:$mobile,password:$password){
    status
    msg
    token
    refresh_token
    data{
     username
     profile_picture
     sex
     mobile
     email
     wechat
     dsc
    }
  }
}
''';
  ///退出登陆
  static const String gqlLoginOut = r'''
query logOut {
    logOut {
        status
        msg
    }
}
''';
  ///用户信息查询
  static const String gqlUserInfo = r'''
query {
    userInfo {
        username
        imageUrl
        sex
        wechat
        dsc
    }
}
''';
  ///修改密码
  ///请求详情
  ///{"mobile": "","area": 0,"password": "","code": ""}
  static const String gqlPasswordChange = r'''
mutation passwordChange ($mobile: String!, $area: Int!, $password: String!, $code: String!) {
    passwordChange (mobile: $mobile, area: $area, password: $password, code: $code) {
        status
        msg
    }
}
''';
  ///修改手机号
  ///请求详情
  ///{"mobile": "","area": 0,"code": ""}
  static const String gqlMobileChange = r'''
mutation mobileChange ($mobile: String!, $area: Int!, $code: String!) {
    mobileChange (mobile: $mobile, area: $area, code: $code) {
        status
        msg
        mobile
    }
}
''';
  ///修改用户个人信息
  ///请求详情
  ///{"name": "","sex": 0,"wechat": "",dsc": ""}
  static const String gqlChangeUserInfo = r'''
mutation changeUserInfo ($name: String!, $sex: Int!, $wechat: String!, $dsc: String!) {
    changeUserInfo (name: $name, sex: $sex, wechat: $wechat, dsc: $dsc) {
        username
        imageUrl
        sex
        wechat
        dsc
    }
}
''';
}
