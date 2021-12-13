/// 检查邮箱格式
bool duIsEmail(String input) {
  if (input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

bool duIsPhone(String input) {
  if (input.isEmpty) return false;
  //11位手机号码正则
  String regexPhone =
      "\^(13[0-9]|14[01456879]|15[0-3,5-9]|16[2567]|17[0-8]|18[0-9]|19[0-3,5-9])d{8}\$";
  return RegExp(regexPhone).hasMatch(input);
}

/// 检查字符长度
bool duCheckStringLength(String input, int length) {
  if (input.isEmpty) return false;
  return input.length >= length;
}
