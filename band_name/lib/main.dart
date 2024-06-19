import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Strings {
  static const appTitle = 'Band name';
  static const nextButtonLabel = 'Sick! Give me another';
  static const generator = 'Generator';
  static const save = 'Save';
  static const saved = 'Saved';
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

  void removeSaved(WordPair value) {
    if (saved.remove(value)) {
      notifyListeners();
    }
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const SavedPage();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 640,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text(Strings.generator),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text(Strings.saved),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    var bandName = "${appState.wordz.asPascalCase} 🤘";
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
      saveButtonLabel = Strings.saved;
    } else {
      icon = Icons.favorite_border;
      saveButtonLabel = Strings.save;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BigCard(bandName, semanticsLabel: semanticsLabel),
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

class SavedPage extends StatelessWidget {
  const SavedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    String numSaved;
    switch (appState.saved.length) {
      case 0:
        numSaved = 'You haven’t saved any band names.';
        break;
      case 1:
        numSaved = 'You have 1 band name saved.';
        break;
      default:
        numSaved = 'You have ${appState.saved.length} band names saved.';
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(numSaved, style: theme.textTheme.headlineSmall),
              for (var wordz in appState.saved)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(wordz.asPascalCase),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: TextButton(
                        onPressed: () {
                          appState.removeSaved(wordz);
                        },
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
            ],
          ),
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
