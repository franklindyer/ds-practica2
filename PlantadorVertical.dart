import 'package:practica2/Plantador.dart';

class PlantadorVertical extends Plantador{

  plantadorVertical(){
    set(500);
  }

  @override
  String toString() {
    return "Plantador vertical de capacidad $capacidad.";
  }

}