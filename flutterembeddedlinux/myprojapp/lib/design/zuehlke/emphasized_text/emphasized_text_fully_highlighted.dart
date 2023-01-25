import 'package:flutter/material.dart';

class EmphasizedTextFullyHighlighted extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const EmphasizedTextFullyHighlighted(this.text, {Key? key, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = (style ?? DefaultTextStyle.of(context).style);
    final fontSize = textStyle.fontSize!;
    final paddingHorizontal = fontSize * 0.2;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Text(text, style: textStyle.emphasizedFullyHighlighted(context)),
    );
  }
}

extension EmphasizedTextStyleFullyHighlighted on TextStyle {
  TextStyle emphasizedFullyHighlighted(BuildContext context) {
    return apply(
      color: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
