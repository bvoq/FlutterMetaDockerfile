import 'package:flutter/material.dart';

class EmphasizedTextPartiallyHighlighted extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const EmphasizedTextPartiallyHighlighted(this.text, {Key? key, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = (style ?? DefaultTextStyle.of(context).style);
    final fontSize = textStyle.fontSize!;
    final underlineSize = fontSize * 0.45;
    final underlineSpacing = fontSize * 0.7;
    const highlightAlpha = 152;
    return IntrinsicWidth(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor.withAlpha(highlightAlpha),
            height: underlineSize,
            margin: EdgeInsets.only(top: underlineSpacing),
          ),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
