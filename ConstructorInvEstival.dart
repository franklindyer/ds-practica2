import 'package:practica2/ConstructorInvernadero.dart';
import 'package:practica2/EstructuraInvernadero.dart';
import 'package:practica2/Iluminacion.dart';
import 'package:practica2/Macetero.dart';
import 'package:practica2/TanqueAgua.dart';
import 'package:practica2/Refrigeracion.dart';
import 'package:practica2/PlantadorHorizontal.dart';

class ConstructorInvEstival extends ConstructorInvernadero {

      void aniadeEstructura() => invernadero.setEstructura(new EstructuraInvernadero(false));

      void aniadeIluminacion() => invernadero.setIluminacion(new Iluminacion(false));

      void aniadeMaceteros() => invernadero.setMaceteros(new Macetero(false));

      void aniadeTanque() => invernadero.setTanqueAgua(new RecolectorAgua(50.0));

      void aniadeControlTemperatura() => invernadero.setControlTemperatura(new Refrigeracion());

      void aniadePlantador() => invernadero.setPlantador(new PlantadorHorizontal());
  
}