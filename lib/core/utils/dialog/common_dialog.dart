import 'package:flutter/material.dart';

import '../error/common_error.dart';

class CommonDialog {
  CommonDialog();

  static Future<void> networkErrorDialog(
    BuildContext context,
    CommonError error,
      VoidCallback onPress,
  ) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SizedBox(
            height: 70,
            child: Column(
              children: [
                Text('${error.message ?? ''}', textAlign: TextAlign.center),
                Text('[${error.code ?? ''}]'),
              ],
            ),
          ),
          contentPadding: EdgeInsets.only(top: 20),
          actions: [
            ElevatedButton(
              // onPressed: () =>  Navigator.pop(context),
              onPressed: onPress,
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
