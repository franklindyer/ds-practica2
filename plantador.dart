abstract class plantador{
  int _capacidad = 0;

  int get capacidad => _capacidad;

  set(int capacidad) => _capacidad = capacidad;

  @override
  String toString(){
    return "La capacidad es de: $_capacidad";
  }
}