import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Strings {
  static const appTitle = 'Band name';
  static const nextButtonLabel = 'Sick! Give me another';
  static const saveButtonLabel = 'Save';
  static const savedButtonLabel = 'Saved';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.black,
          ),
          brightness: Brightness.dark,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var saved = <WordPair>[];
  var wordz = WordPair.random();

  void getNext() {
    wordz = WordPair.random();
    notifyListeners();
  }

  void toggleSaved() {
    if (saved.contains(wordz)) {
      saved.remove(wordz);
    } else {
      saved.add(wordz);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var nextButtonLabel = "${appState.wordz.asPascalCase} 🤘";

    var semanticsLabel = "${appState.wordz.first} ${appState.wordz.second}";

    var theme = Theme.of(context);
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.background,
      foregroundColor: theme.colorScheme.onBackground,
    );

    IconData icon;
    String saveButtonLabel;
    if (appState.saved.contains(appState.wordz)) {
      icon = Icons.favorite;
      saveButtonLabel = Strings.savedButtonLabel;
    } else {
      icon = Icons.favorite_border;
      saveButtonLabel = Strings.saveButtonLabel;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BigCard(nextButtonLabel, semanticsLabel: semanticsLabel),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: buttonStyle,
                    onPressed: () {
                      appState.toggleSaved();
                    },
                    icon: Icon(icon),
                    label: Text(
                      saveButtonLabel,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      appState.getNext();
                    },
                    child: const Text(
                      Strings.nextButtonLabel,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard(
    this.data, {
    this.semanticsLabel,
    super.key,
  });

  final String data;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.background,
    );

    return Card(
      color: theme.colorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          data,
          semanticsLabel: semanticsLabel,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
