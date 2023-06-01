import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final pokedex = <Pokemon>[
    const Pokemon('Artikodin', Icons.ac_unit),
    const Pokemon('Sulfura', Icons.sunny),
    const Pokemon('Electhor', Icons.thunderstorm),
    const Pokemon('Mewtwo', Icons.remove_red_eye),
  ];

  bool _isNameExists(String name) {
    final lowercaseName = name.toLowerCase();
    for (final Pokemon item in pokedex) {
      if (item.nom.toLowerCase() == lowercaseName) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Premier projet'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              labelText: 'Ecrivez un nom',
                            ),
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              final nameToAdd = controller.text;
                              setState(() {
                                if (nameToAdd.length >= 3 &&
                                    _isNameExists(nameToAdd) == false) {
                                  pokedex.insert(
                                    0,
                                    Pokemon(nameToAdd, Icons.question_mark),
                                  );
                                  controller.clear();
                                } else {
                                  if (nameToAdd.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please enter a name.'),
                                      ),
                                    );
                                  } else if (nameToAdd.length < 3) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'The name should be equal or more than 3 characters'),
                                      ),
                                    );
                                  } else if (_isNameExists(nameToAdd)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('This name already exists.'),
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    for (final Pokemon item in pokedex)
                      TheAmazingRow(
                        label: item.nom,
                        icon: item.image,
                        onDelete: () {
                          setState(() {
                            pokedex.remove(item);
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      initialRoute: PageName.home,
      routes: {
        PageName.detail: (context) => const SecondScreen(),
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(pokemonName),
        ),
      ),
    );
  }
}

class Pokemon {
  final IconData image;
  final String nom;

  const Pokemon(this.nom, this.image);

  String get nomMaj => nom.toUpperCase();
}

class PageName {
  static const String home = '/';
  static const String detail = '/detail';
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.onDelete,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        PageName.detail,
        arguments: label,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Expanded(
                child: Text(label),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
