import 'package:fluttertoast/fluttertoast.dart';
import 'package:skill_sync/constants/colors.dart';

class CustomToast {
  static void bottomToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: CustomColors.toastBackgroundColor,
      textColor: CustomColors.toastTextColor,
      fontSize: 14.0,
    );
  }
}
