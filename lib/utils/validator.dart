//参考https://tool.lu/regex/
/// 检查邮箱格式
bool duIsEmail(String input) {
  if (input.isEmpty) return false;

  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

//检查手机号码
bool duIsPhone(String input) {
  if (input.isEmpty) return false;

  String regexPhone = "(13d|14[579]|15[^4D]|17[^49D]|18d)d{8}";
  return RegExp(regexPhone).hasMatch(input);
}

// 检查字符长度
bool duCheckStringLength(String input, int length) {
  if (input.isEmpty) return false;
  return input.length >= length;
}

//检查身份证号码
bool idPhone(String input) {
  if (input.isEmpty) return false;

  String regexPhone =
      "(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)";
  return RegExp(regexPhone).hasMatch(input);
}
