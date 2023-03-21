class EstructuraInvernadero {

      bool _reforzada;

      EstructuraInvernadero(this._reforzada);

      @override
      String toString() {
      	     String indicadorReforzada = " no";
	     if (_reforzada) indicadorReforzada = "";
	     return "Estructura$indicadorReforzada reforzada";
      }

}