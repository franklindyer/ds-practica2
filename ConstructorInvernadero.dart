import 'package:practica2/Invernadero.dart';

abstract class ConstructorInvernadero{
  Invernadero invernadero = new Invernadero();

  ConstructorInvernadero(){}

  void aniadeEstructura();

  void aniadeIluminacion();

  void aniadeMaceteros();

  void aniadeTanque();

  void aniadeControlTemperatura();

  void aniadePlantador();

  Invernadero resultado() {
    aniadeEstructura();
    aniadeIluminacion();
    aniadeMaceteros();
    aniadeTanque();
    aniadeControlTemperatura();
    aniadePlantador();
    return invernadero;
  }

  void reset() => invernadero = new Invernadero();
  
}