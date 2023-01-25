import 'package:flutter/material.dart';

import '../design/zuehlke/emphasized_text/emphasized_text.dart';

class MainPageTitle extends StatelessWidget {
  const MainPageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        EmphasizedText(
          "Hello,",
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          "welcome to the",
          style: Theme.of(context).textTheme.headline3,
        ),
        EmphasizedText(
          "Zühlke Flutter Embedded",
          type: EmphasizeType.partialHighlighted,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          "Boilerplate",
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
