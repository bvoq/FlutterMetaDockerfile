import 'package:flutter/material.dart';
import 'package:juiceflutterpoc/design/zuehlke/emphasized_text/emphasized_text_fully_highlighted.dart';

import '../design/zuehlke/zuehlke_theme.dart';

class MainPageText extends StatelessWidget {
  const MainPageText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2!;
    final emphasizedBodyTextStyle =
        bodyTextStyle.emphasizedFullyHighlighted(context);

    const borderMaxWidth = 400.0;
    const spacingBetweenElements = 16.0;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: borderMaxWidth),
      child: IntrinsicWidth(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Hi this is the ',
                style: bodyTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Zühlke Boilerplate',
                    style: emphasizedBodyTextStyle,
                  ),
                  const TextSpan(text: ' for '),
                  TextSpan(
                    text: 'Flutter Embedded',
                    style: emphasizedBodyTextStyle,
                  ),
                  const TextSpan(
                      text: ' projects. To get started clone this repository '
                          'and executed the following command in the '),
                  TextSpan(
                    text: 'flutterembeddedlinux',
                    style: emphasizedBodyTextStyle,
                  ),
                  const TextSpan(
                      text: ' folder of '
                          'the repository: '),
                ],
              ),
            ),
            const SizedBox(height: spacingBetweenElements),
            const CodeBlock('\$ bash step1_build_yocto.sh'),
            const SizedBox(height: spacingBetweenElements),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Next, modify the flutter project ',
                style: bodyTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: 'myproj',
                    style: emphasizedBodyTextStyle,
                  ),
                  TextSpan(
                    text: ' to contain your embedded code. '
                        'Afterwards you can build it for embedded linux using: ',
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: spacingBetweenElements),
            const CodeBlock('\$ bash step2_build_embedded_flutter_app.sh'),
            const SizedBox(height: spacingBetweenElements),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'This should create a build folder and '
                    'you can see an example of how to run the app in ',
                style: bodyTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: 'myproj',
                    style: emphasizedBodyTextStyle,
                  ),
                  TextSpan(
                    text: ' to contain your embedded code.\n '
                        'Afterwards you can run ',
                    style: bodyTextStyle,
                  ),
                  TextSpan(
                    text: 'run the application',
                    style: emphasizedBodyTextStyle,
                  ),
                  const TextSpan(text: ' with the following commands: '),
                ],
              ),
            ),
            const SizedBox(height: spacingBetweenElements),
            const CodeBlock('\$ cat step3_runonqemu64.sh'),
          ],
        ),
      ),
    );
  }
}

class CodeBlock extends StatelessWidget {
  final String text;

  const CodeBlock(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2!;

    const codeBlockFontFamily = 'Courier';
    const borderWidth = 1.0;
    const borderRadius = 4.0;
    const blockPaddingVertical = 12.0;
    const blockPaddingHorizontal = 8.0;
    const lineSpacing = 1.3;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ZuehlkeColors.lightGray.color,
        border: Border.all(
          color: ZuehlkeColors.darkGray.at50PercentShade,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: blockPaddingVertical,
        horizontal: blockPaddingHorizontal,
      ),
      child: Text(
        text,
        style: bodyTextStyle.copyWith(
          fontFamily: codeBlockFontFamily,
          height: lineSpacing,
        ),
      ),
    );
  }
}
