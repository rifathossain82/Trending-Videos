import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/utils/color.dart';

class DialogService{
  static Future<bool?> confirmationDialog({
    required BuildContext context,
    required String title,
    required String negativeActionText,
    required String positiveActionText,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            icon: Icon(
              Icons.question_mark,
              color: kPrimaryColor,
            ),
            title: Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  negativeActionText,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: kGrey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  positiveActionText,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          );
        });
  }

  static Future<bool?> customDialog({
    required BuildContext context,
    required String title,
    required AlignmentGeometry dialogPosition,
    List<Widget>? actions,
    Widget? content,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: content,
            ),
            insetPadding: const EdgeInsets.all(15),
            alignment: dialogPosition,
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: actions,
          );
        });
  }
}