import 'package:flutter/material.dart';

class EmphasizedTextUnderlined extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const EmphasizedTextUnderlined(this.text, {Key? key, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = (style ?? DefaultTextStyle.of(context).style);
    final fontSize = textStyle.fontSize!;
    final underlineSize = fontSize * 0.15;
    final underlineSpacing = fontSize * 1.11;
    return IntrinsicWidth(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: underlineSize,
            margin: EdgeInsets.only(top: underlineSpacing),
          ),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
