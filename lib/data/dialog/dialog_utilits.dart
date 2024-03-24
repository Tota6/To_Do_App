import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context, String messages,
      {bool isDismissible = true}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(
              messages,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      barrierDismissible: isDismissible,
    );
  }

  static void hideLoadingDialog(context) {
    Navigator.pop(context);
  }

  static void showMassage(context, String message,
      {bool isDismissible = true,
      String? posActionsTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionsTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionsTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }
    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionTitle,
              style: Theme.of(context).textTheme.titleSmall),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: actions,
      ),
      barrierDismissible: isDismissible,
    );
  }
}
