import 'package:flutter/material.dart';

import 'main_page_text.dart';
import 'main_page_title.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loadedImage = false;
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
                  onPressed: () {
                    setState(() {
                      loadedImage = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text("Download an image"),
                ),
                const SizedBox(height: spacingBetweenElements),
                loadedImage
                    ? Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Wayland_Logo.svg/1920px-Wayland_Logo.svg.png')
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
