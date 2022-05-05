import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class PFcheck {
  static email(String value) {
    return Fzregex.hasMatch(value, FzPattern.email);
  }

  static username(String value) {
    return Fzregex.hasMatch(value, FzPattern.username);
  }

  static url(String value) {
    return Fzregex.hasMatch(value, FzPattern.url);
  }

  static phone(String value) {
    return Fzregex.hasMatch(value, FzPattern.phone);
  }

  static md5(String value) {
    return Fzregex.hasMatch(value, FzPattern.md5);
  }

//----------------------------------------------------------------------------------------
  static bool duIsEmail(String input) {
    if (input.isEmpty) return false;

    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    return RegExp(regexEmail).hasMatch(input);
  }

  //检查手机号码
  static bool duIsPhone(String input) {
    if (input.isEmpty) return false;

    String regexPhone = "0?(13|14|15|18|17)[0-9]{9}";
    return RegExp(regexPhone).hasMatch(input);
  }

  // 检查字符长度
  static bool duCheckStringLength(String input, int length) {
    if (input.isEmpty) return false;
    return input.length >= length;
  }

  //检查身份证号码
  static bool idPhone(String input) {
    if (input.isEmpty) return false;

    String regexPhone =
        "(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";
    return RegExp(regexPhone).hasMatch(input);
  }
}



//参考https://tool.lu/regex/
/// 检查邮箱格式

//   Fzregex.hasMatch('Krishna_Ra1', FzPattern.username);
//   Fzregex.hasMatch('+91 7009046544', FzPattern.phone);
//   Fzregex.hasMatch('krishna@gmail.com', FzPattern.email);
//   Fzregex.hasMatch('https://youtube.com/', FzPattern.url);
//   Fzregex.hasMatch('\$ 100,000', FzPattern.currency);
