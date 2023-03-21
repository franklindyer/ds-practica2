class CondicionesInvernadero {

      double _temperatura;
      double _humedad;
      double _fertilizante;

      double get temperatura => _temperatura;
      double get humedad => _humedad;
      double get fertilizante => _fertilizante;

      set temperatura(double tempNuevo) => _temperatura = tempNuevo;
      set humedad(double humNuevo) => _humedad = humNuevo;
      set fertilizante(double fertNuevo) => _fertilizante = fertNuevo;

      CondicionesInvernadero(this._temperatura,
			     this._humedad,
			     this._fertilizante);

      @override
      String toString() =>
      	     "Temperatura: $temperatura\nHumedad: $humedad\nFertilizante: $fertilizante";

}