import 'package:flutter/material.dart';

class AppDialogs{
  static showMultiActionDialog({required BuildContext context,required String title,required String content,required String posBtn,required String negBtn,VoidCallback? posAction,VoidCallback? negAction,}){
    showDialog(context: context, builder: (_)=>AlertDialog(
      title: Text(title),
      content: Text(content),
      alignment: AlignmentDirectional.centerStart,
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      actionsPadding: EdgeInsets.zero,
      actions: [
        TextButton(onPressed: negAction, child: Text(negBtn)),
        TextButton(onPressed: posAction, child: Text(posBtn)),
      ],
    ));
  }
}