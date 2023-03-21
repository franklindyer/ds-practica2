import 'dart:svg';

abstract class ControlTemperatura{
  double _temperaturaActual = 0.0;
  double _termostato = 0.0;

  double get temperaturaActual => _temperaturaActual;
  double get termostato => _termostato;

  set(double temperaturaActual, double termostato){
    this._temperaturaActual = temperaturaActual;
    this._termostato = termostato;
  }


  String toString(){
    return "La temperatura actual es: $_temperaturaActual y el termostato: $_termostato";
  }
}