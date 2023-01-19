import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

//   final String? hint;
//   return InputDecoration(
//     hintText: hint,
//     labelText: label,
//     labelStyle: TextStyle(
//       color: labelColor,
//       fontSize: textSize,
//     ),
//     prefixIcon: prefix != null
//         ? Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: prefix,
//           )
//         : null,
//     suffixIcon: suffix != null
//         ? Padding(
//             padding: const EdgeInsets.only(),
//             child: IconButton(
//               onPressed: () {
//                 suffixPressed!();
//               },
//               icon: Icon(suffix, color: suffixColor, size: suffixSize),
//             ),
//           )
//         : null,
//     border: const UnderlineInputBorder(),
//   );
// }

// void checkInternetWrapper() async {
//   final bool result = await MyApplication.checkInternet();
//   if (!result) {
//     MyApplication.showToast(
//         text: "No Internet connection | لا يوجد اتصال",
//         color: ToastColors.error);
//   } else {
//     //list of functions

//   }
// }

class MyApplication {
  static Future<bool> checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      const flag = true;
      return flag;
    } else {
      const flag = false;
      return flag;
    }
  }

  static double hightClc(BuildContext context, int myHeight) {
    return MediaQuery.of(context).size.height * myHeight / 926;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  static navigateToReplace(Widget page, BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  // static showToast({
  //   required String text,
  //   required ToastColors color,
  // }) {
  //   Fluttertoast.showToast(
  //     msg: text,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: setToastColor(color),
  //     textColor: Colors.white,
  //     fontSize: 16,
  //   );
  // }

  static InputDecoration textFieldInputDecoration(
      {String? hintText,
      String? labelText,
      String? helperText,
      Color? hintColor,
      IconData? prefixIcon,
      IconData? suffixIcon,
      String? errorText}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,

      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      errorText: errorText,
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 17, top: 16, bottom: 13),
      isDense: true,
      hintStyle:
          TextStyle(color: hintColor ?? const Color(0xFFB6B6B6), fontSize: 16),
      labelStyle: const TextStyle(color: Color(0xFFB6B6B6), fontSize: 16),

      // floatingLabelBehavior: FloatingLabelBehavior.always,
      // suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      // prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  static double widthClc(BuildContext context, int myWidth) {
    return MediaQuery.of(context).size.width * myWidth / 428;
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

enum ToastColors {
  success,
  error,
  warning,
}
