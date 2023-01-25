import 'package:flutter/material.dart';

import 'main_page_text.dart';
import 'main_page_title.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacingBetweenElements = 32.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("juiceflutterpoc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const MainPageTitle(),
                const SizedBox(height: spacingBetweenElements),
                const MainPageText(),
                const SizedBox(height: spacingBetweenElements),
                TextButton(
                  key: const Key('GoToCICDPage'),
                  onPressed: () => print('Todo Go to next page'),
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text("Go to Pipeline Setup"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
