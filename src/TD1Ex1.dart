import 'dart:math';
import 'dart:io';

void main() {
  final nbDeviner = 1 + Random().nextInt(100);
  print(nbDeviner);
  print("Choisis un nombre stp");
  String? demande = stdin.readLineSync();
  if (demande.toString().length == 0) {
    print("met qq chose sale gitan");
  }
  else if (int.tryParse(demande.toString()) == null) {
    print("met un nombre sale gitan");
  }
  if (nbDeviner == int.parse(demande.toString())) {
    print("Bravo tu a trouvé le nombre mystère");
  }
  else if (nbDeviner >= int.parse(demande.toString())) {
    print("tu est en dessous");
  }
  else if (nbDeviner <= int.parse(demande.toString())) {
    print("tu est au dessus");
  }
}