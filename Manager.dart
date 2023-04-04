import 'package:practica2/Invernadero.dart';
import 'package:practica2/ConstructorInvEstival.dart';
import 'package:practica2/ConstructorInvInvernal.dart';
import 'package:practica2/ConstructorInvernadero.dart';
import 'package:practica2/Invernadero.dart';

class Manager{
  List<Invernadero> _invernaderos = [];
  ConstructorInvEstival _constructorEstival = new ConstructorInvEstival();
  ConstructorInvInvernal _constructorInvernal = new ConstructorInvInvernal();

  Manager(){}

  Invernadero? getInvernadero(int indice){
      if (indice >= _invernaderos.length) return null;
      return _invernaderos[indice];
  }

  int getNumInvernaderos(){
    return _invernaderos.length;
  }

  Invernadero crearInvernaderoEstival(){
    Invernadero inv = _constructorEstival.resultado();
    _constructorEstival.reset();
    if(inv != null){
      _invernaderos.add(inv);
    }
    return _invernaderos[_invernaderos.length - 1];
  }

  Invernadero crearInvernaderoInvernal(){
    Invernadero inv = _constructorInvernal.resultado();
    if(inv != null){
      _invernaderos.add(inv);
    }
    return _invernaderos[_invernaderos.length - 1];
  }

  void eliminarInvernadero(int indice){
    _invernaderos.remove(indice);
  }


  void controlarInvernaderos(){
    print("Invernadero controlado");
  }

}
