import 'package:flutter/material.dart';

class DialogHelper {
  // static void showSnackBar({
  //   required String title,
  //   required String message,
  //   required Color backgroundColor,
  //   required BuildContext context,
  // }) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Theme.of(context).iconTheme.color,
  //     titleText: InkWell(
  //       onTap: () => Get.offAllNamed(AppRouting.signInView),
  //       child: Text(
  //         title,
  //         style: TextStyle(color: Theme.of(context).backgroundColor),
  //       ),
  //     ),
  //     messageText: InkWell(
  //       onTap: () => Get.offAllNamed(AppRouting.signInView),
  //       child: Text(
  //         message,
  //         style: TextStyle(
  //             color: Theme.of(context).backgroundColor,
  //             fontSize: 14,
  //             fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //     borderRadius: 8,
  //     margin: EdgeInsets.all(16),
  //     animationDuration: Duration(milliseconds: 700),
  //   );
  // }

  // static void showSnackBarLink({
  //   required String title,
  //   required String message,
  //   required Color backgroundColor,
  // }) {
  //   Get.snackbar(
  //     title,
  //     message,
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: AppColors.black,
  //     titleText: InkWell(
  //       onTap: () => Get.offAllNamed(AppRouting.signInView),
  //       child: Text(
  //         title,
  //         style: TextStyle(color: AppColors.white),
  //       ),
  //     ),
  //     messageText: InkWell(
  //       onTap: () {},
  //       child: Text(
  //         message,
  //         style: TextStyle(
  //             color: AppColors.white,
  //             fontSize: 14,
  //             fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //     borderRadius: 8,
  //     margin: EdgeInsets.all(16),
  //     animationDuration: Duration(milliseconds: 700),
  //   );
  // }

  // static void showDialog({
  //   required String dialogText,
  //   //required IconData iconData,
  //   required String buttonText,
  //   required Function()? onTap,
  //   Color? iconColor = Colors.blue,
  // }) {
  //   Get.defaultDialog(
  //     title: '',
  //     titleStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //     content: Column(
  //       children: [
  //         // Icon(
  //         //   iconData,
  //         //   size: 50,
  //         //   color: iconColor,
  //         // ),
  //         SizedBox(height: 20),
  //         Text(
  //           dialogText,
  //           textAlign: TextAlign.center,
  //           style: getMyStyle(
  //               size: FontSizes.sp12 + 1,
  //               fontWeight: FontWeight.w500,
  //               color: AppColors.black),
  //         ),
  //         SizedBox(height: 20),
  //       ],
  //     ),
  //     confirm: TextButton(
  //       onPressed: onTap,
  //       child: Text(
  //         buttonText,
  //         style: getMyStyle(
  //             size: FontSizes.sp12 + 1,
  //             fontWeight: FontWeight.w500,
  //             color: AppColors.white),
  //       ),
  //       style: TextButton.styleFrom(
  //         backgroundColor: Colors.blue,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
  //       ),
  //     ),
  //   );
  // }

  //   static void showDialogIcon({
  //   required String dialogText,
  //   required IconData iconData,
  //   required String buttonText,
  //   required Function()? onTap,
  //   Color? iconColor = Colors.blue,
  // }) {
  //   Get.defaultDialog(
  //     title: '',
  //     titleStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //     content: Column(
  //       children: [
  //         Icon(
  //           iconData,
  //           size: 50,
  //           color: iconColor,
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           dialogText,
  //           textAlign: TextAlign.center,
  //           style: getMyStyle(
  //               size: FontSizes.sp12 + 1,
  //               fontWeight: FontWeight.w500,
  //               color: AppColors.black),
  //         ),
  //         SizedBox(height: 20),
  //       ],
  //     ),
  //     confirm: TextButton(
  //       onPressed: onTap,
  //       child: Text(
  //         buttonText,
  //         style: getMyStyle(
  //             size: FontSizes.sp12 + 1,
  //             fontWeight: FontWeight.w500,
  //             color: AppColors.white),
  //       ),
  //       style: TextButton.styleFrom(
  //         backgroundColor: Colors.blue,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
  //       ),
  //     ),
  //   );
  // }

  // static void hideDialog() {
  //   Get.back();
  // }

  void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Dialog can only be dismissed by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
                const SizedBox(height: 8),
                Text(
                  'انتظر...',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //hide loading
  static void hideLoading(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
