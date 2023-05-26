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
    // <== liste finale, contenu constant
    const Pokemon('Artikodin', Icons.ac_unit),
    const Pokemon('Sulfura', Icons.sunny),
    const Pokemon('Electhor', Icons.thunderstorm),
    const Pokemon('Mewtwo', Icons.remove_red_eye),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
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
                              if (nameToAdd.length >= 3) {
                                pokedex.insert(
                                  0,
                                  Pokemon(nameToAdd, Icons.question_mark),
                                );
                                controller.clear();
                              } else {}
                            });
                          }),
                    )
                  ],
                ),
                for (final Pokemon item in pokedex)
                  TheAmazingRow(
                    label: item.nom,
                    icon: item.image,
                  ),
              ],
            ),
          ),
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

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({Key? key, required this.icon, required this.label})
      : super(key: key);
// la c'est entre le constructeur
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
