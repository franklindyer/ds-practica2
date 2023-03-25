import 'package:practica2/ConstructorInvernadero.dart';
import 'package:practica2/Invernadero.dart';

class DirectorConstructor {

      DirectorConstructor() {}

      Invernadero crearInvernadero(ConstructorInvernadero cons) {
      		  cons.reset();
		  cons.aniadeEstructura();
		  cons.aniadeIluminacion();
		  cons.aniadeMaceteros();
		  cons.aniadeTanque();
		  cons.aniadeControlTemperatura();
		  cons.aniadePlantador();
		  
      		  Invernadero inv = cons.resultado();
		  return inv;
      }

}