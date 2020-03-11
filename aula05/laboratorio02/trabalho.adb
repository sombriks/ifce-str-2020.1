with Ada.Text_IO; use Ada.Text_IO; 

with MyArray;

package body Trabalho is
  -- fase 1 : preencher
  function Preenche(
    Ray : in out Myarray.ArrArr; 
    I : in out Integer; 
    J : Integer; 
    V : Myarray.ArrVal
  ) return Boolean is
  begin
    -- fase 1 : preencher
    while I <= J loop
      Ray(MyArray.ArrIdx(I)) := V;
      I := I + 1;
    end loop;
    return True;
  end Preenche;
  -- fase 2 : imprimir
  function Imprime(
    Ray : Myarray.ArrArr; 
    I : in out Integer; 
    J : Integer
  ) return Boolean is
  begin
    while I <= J loop
      Put(MyArray.ArrVal'Image(Ray(Myarray.ArrIdx(I))));
      I := I + 1;
    end loop;
    Put_Line("");
    return True;
  end Imprime;
end Trabalho;