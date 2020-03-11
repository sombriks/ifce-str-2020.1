with MyArray;

package Trabalho is
  function Preenche(
    Ray : in out Myarray.ArrArr; 
    I : in out Integer; 
    J : Integer; 
    V : Myarray.ArrVal
  ) return Boolean;
  function Imprime(Ray : Myarray.ArrArr; I : Integer; J : Integer) return Boolean;
end Trabalho;