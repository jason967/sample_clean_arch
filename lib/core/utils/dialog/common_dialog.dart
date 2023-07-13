import 'package:flutter/material.dart';

import '../error/common_error.dart';

class CommonDialog {
  CommonDialog();

  static Future<void> networkErrorDialog(
    BuildContext context,
    CommonError error,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Container(
            alignment: Alignment.center,
            height: 40,
            child: Text('${error.message ?? ''} \n [${error.code}]'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
          actionsPadding: EdgeInsets.zero,
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
        );
      },
    );
  }
}
