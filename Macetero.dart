class Macetero {

      bool activar = false;

      Macetero(bool activar){
        this.activar = activar;
      }

      String toString(){
        if(activar){
          return "Macetero activado";
        }else{
          return "Macetero desactivado";
        }
      }

}