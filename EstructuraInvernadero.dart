class EstructuraInvernadero {

      bool _reforzada = false;

      EstructuraInvernadero(bool reforzada){
        this._reforzada = reforzada;
      }

      @override
      String toString() {
      	     String indicadorReforzada = " no";
	     if (_reforzada) indicadorReforzada = "";
	     return "Estructura$indicadorReforzada reforzada";
      }

}