class Iluminacion {
    bool activar = false;

      Iluminacion(bool activar){
        this.activar = activar;
      }

      String toString(){
        if(activar){
          return "Iluminación activada";
        }else{
          return "Iluminación desactivada";
        }
      }

}