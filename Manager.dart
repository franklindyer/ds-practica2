import 'package:flutter/material.dart';
import 'package:practica2/ConstructorInvEstival.dart';
import 'package:practica2/ConstructorInvInvernal.dart';
import 'package:practica2/ConstructorInvernadero.dart';
import 'package:practica2/Invernadero.dart';

class Manager{
  List<Invernadero> _invernaderos = [];
  ConstructorInvernadero? _constructor;

  Manager(){}

  Invernadero getInvernadero(int indice){
      return _invernaderos[indice];
  }

  int getNumInvernaderos(){
    return _invernaderos.length;
  }

  Invernadero crearInvernaderoEstival(){
    _constructor = new ConstructorInvEstival();
    Invernadero? inv = _constructor?.getInvernadero();
    if(inv != null){
      _invernaderos.add(inv);
    }
    return _invernaderos[_invernaderos.length - 1];
  }

  Invernadero crearInvernaderoInvernal(){
   _constructor = new ConstructorInvInvernal();
    Invernadero? inv = _constructor?.getInvernadero();
    if(inv != null){
      _invernaderos.add(inv);
    }
    return _invernaderos[_invernaderos.length - 1];
  }


  void controlarInvernaderos(){
    print("Invernadero controlado");
  }
  
}