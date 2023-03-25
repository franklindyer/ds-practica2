import 'package:practica2/Plantador.dart';

class PlantadorHorizontal extends Plantador{

  PlantadorHorizontal(){
    set(1000);
  }

  @override
  String toString() {
    return "Plantador horizontal de capacidad $capacidad.";
  }
  

}