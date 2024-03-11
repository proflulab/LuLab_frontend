class SchemaUser {
  ///邮箱验证码发送
  ///请求数据参考
  ///{"email": "2464854077@qq.com"}
  static const String gqlVerifySendEmail = r'''
query sendEmailCode($email: String!) {
  sendEmailCode(email: $email) {
    status
    msg
  }
}
''';

  ///邮箱验证码验证
  ///请求数据参考
  ///{"email": "2464854077@qq.com","code": "010062"}
  static const String gqlVerifyCheckEmail = r'''
mutation emailCodeLogin($email: String!, $code: String!) {
    emailCodeLogin(email: $email, code: $code) {
        token
        refresh_token
        user {
            name
            avatar
            sex
            ctry_code
            mobile
            email
            description
        }
    }
}
''';

  ///手机验证码发送
  ///请求数据参考
  ///{"mobile":"15110880530","area":"+86"}
  static const String gqlVerifySend = r'''
query sendSmsCode($mobile: String!, $ctry_code: String!) {
  sendSmsCode(mobile: $mobile, ctry_code: $ctry_code) {
    status
    msg
  }
}

''';

  ///手机验证码验证
  ///请求数据参考
  ///{"mobile":"15110880530","area":"+86","code":"312113"}
  ///int=>string
  static const String gqlVerifyCheck = r'''
mutation refactored87($mobile: String!, $code: String!, $ctry_code: String!) {
  mobileCodeLogin(mobile: $mobile, code: $code, ctry_code: $ctry_code) {
    token
    refresh_token
    user {
      name
      avatar
      sex
      mobile
      email
      description
    }
  }
}
''';

  ///手机验证码登陆
  ///请求数据参考
  ///{"mobile":"15110880530","area":"+86","code":"312113"}
  static const String gqlLoginCaptcha = r'''
query loginCaptcha ($mobile: String!, $area: String!, $code: String!) {
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
mutation passwordChange ($mobile: String!, $area: String!, $password: String!, $code: String!) {
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
mutation mobileChange ($mobile: String!, $area: String!, $code: String!) {
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
