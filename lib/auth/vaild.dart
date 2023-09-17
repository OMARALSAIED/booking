import 'package:booking/auth/Messages.dart';

VaildInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messagemax $max";
  }
  if (val.isEmpty) {
    return "$messageEmpty";
  }
  if (val.length < min) {
    return "$messageMin $min";
  }
}
