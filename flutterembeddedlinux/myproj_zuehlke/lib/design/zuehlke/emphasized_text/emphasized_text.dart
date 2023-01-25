import 'package:flutter/material.dart';
import 'emphasized_text_fully_highlighted.dart';
import 'emphasized_text_partially_highlighted.dart';
import 'emphasized_text_underlined.dart';

class EmphasizedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EmphasizeType type;

  const EmphasizedText(this.text,
      {Key? key, this.type = EmphasizeType.underline, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EmphasizeType.underline:
        return EmphasizedTextUnderlined(text, style: style);
      case EmphasizeType.fullyHighlighted:
        return EmphasizedTextFullyHighlighted(text, style: style);
      case EmphasizeType.partialHighlighted:
        return EmphasizedTextPartiallyHighlighted(text, style: style);
    }
  }
}

enum EmphasizeType {
  underline,
  fullyHighlighted,
  partialHighlighted,
}
