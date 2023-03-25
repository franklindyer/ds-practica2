import 'package:practica2/Calefaccion.dart';
import 'package:practica2/CondicionesInvernadero.dart';
import 'package:practica2/EstructuraInvernadero.dart';
import 'package:practica2/Iluminacion.dart';
import 'package:practica2/Macetero.dart';
import 'package:practica2/TanqueAgua.dart';
import 'package:practica2/Calefaccion.dart';
import 'package:practica2/ControlTemperatura.dart';
import 'package:practica2/Plantador.dart';
import 'package:practica2/Refrigeracion.dart';

class Invernadero{
  CondicionesInvernadero? _condiciones;
  ControlTemperatura? _temperatura;
  EstructuraInvernadero? _estructura;
  Macetero? _macetero;
  Iluminacion? _iluminacion;
  TanqueAgua? _agua;
  Plantador? _plantador;

  Invernadero(){
    this._condiciones = new CondicionesInvernadero(0.0, 0.0, 0.0);
  }

  void setEstructura(EstructuraInvernadero estructura){
    this._estructura = estructura;
  }

  void setMaceteros(Macetero macetero){
    this._macetero = macetero;
  }

  void setIluminacion(Iluminacion iluminacion){
    this._iluminacion = iluminacion;
  }

  void setTanqueAgua(TanqueAgua agua){
    this._agua = agua;
  }

  void setControlTemperatura(ControlTemperatura ctemperatura){
    this._temperatura = ctemperatura;
  }

  void setPlantador(Plantador plantador){
    this._plantador = plantador;
  }

  void infoInvernadero(){
      print(_agua.toString());
      print(_condiciones.toString());
      print(_estructura.toString());
      print(_iluminacion.toString());
      print(_macetero.toString());
      print(_plantador.toString());
      print(_temperatura.toString());
  }



}