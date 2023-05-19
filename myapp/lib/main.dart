import 'package:flutter/material.dart';

void main() => runApp(
      const TestWidget(),
    );

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokedex = <Pokemon>[
      // <== liste finale, contenu constant
      Pokemon('Artikodin', Icons.ac_unit),
      Pokemon('Sulfura', Icons.sunny),
      Pokemon('Electhor', Icons.thunderstorm),
      Pokemon('Mewtwo', Icons.remove_red_eye),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Yepa")),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Ton Texte",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            for (final Pokemon item in pokedex)
              TheAmazingRow(
                label: item.nom,
                icon: item.image,
              ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(80)),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          Icon(icon),
          /*const Spacer(
            flex: 2,
          ),*/
          SizedBox(
            width: 16,
          ),
          Text(label),
          const Spacer(
            flex: 2,
          ),
          /*SizedBox(
            width: 160,
          ),*/
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () => print(label),
          ),
        ],
      ),
    );
  }
}

class Pokemon {
  final IconData image;
  final String nom;

  Pokemon(this.nom, this.image);

  String get nomMaj => nom.toUpperCase();
}
