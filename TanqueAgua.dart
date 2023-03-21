abstract class TanqueAgua {

	 double _litros;

	 double get litros => _litros;

	 TanqueAgua(this._litros);

	 String toString();

}

class RecolectorAgua extends TanqueAgua {

      RecolectorAgua(_litros) : super(_litros);

      String toString() =>
      	     "TanqueAgua tipo RecolectorAgua, $litros litros.";

}

class FuenteCiudad extends TanqueAgua {

      FuenteCiudad(_litros) : super(_litros);

      String toString() =>
      	     "TanqueAgua tipo FuenteCiudad, $litros litros.";

}