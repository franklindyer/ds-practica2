import 'package:practica2/Invernadero.dart';

abstract class ConstructorInvernadero{
  Invernadero invernadero = new Invernadero();

  ConstructorInvernadero(){}

  Invernadero getInvernadero(){
    return invernadero;
  }

  void aniadeEstructura();

  void aniadeIluminacion();

  void aniadeMaceteros();

  void aniadeTanque();

  void aniadeControlTemperatura();

  void aniadePlantador();

  Invernadero resultado() => invernadero;

  void reset() => invernadero = new Invernadero();
  
}