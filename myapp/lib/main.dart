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
    return Scaffold(
      appBar: AppBar(title: const Text("Yepa")),
      body: Center(
        child: Column(
          children: const [
            TheAmazingRow(
              label: "Yepa",
              icon: Icons.snowboarding,
            ),
            SizedBox(height: 16),
            TheAmazingRow(
              label: "Yopo",
              icon: Icons.cloud,
            ),
            SizedBox(height: 16),
            TheAmazingRow(
              label: "Yolo",
              icon: Icons.sunny,
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
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
  IconData image_;
  String nom_;

  Pokemon({this.image_, this.nom_});

  String get nom {
    return nom_ ?? "Pas de nom";
  }

  IconData get image {
    return image_;
  }
}
