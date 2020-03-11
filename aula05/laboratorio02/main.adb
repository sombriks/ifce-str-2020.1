with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with MyArray;
with Trabalho;

procedure main is
   B : Boolean;
   I1 : Integer := 0;
   I2 : Integer := 10;
   I3 : Integer := 20;
   Arr : MyArray.ArrArr := ('?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?');
    -- declarando as tasks
   task T1 is
    entry Preenche;
    entry Imprime;
   end T1;
   task T2 is
    entry Preenche;
    entry Imprime;
   end T2;
   task T3 is 
    entry Preenche;
    entry Imprime;
   end T3;
  -- body das tasks
  task body T1 is
  begin
    accept Preenche;
      B := Trabalho.Preenche(Arr,I1,9,'a');
      T2.Preenche;
    accept Imprime;
      I1 := 0;
      B := Trabalho.Imprime(Arr,I1,9);
      T2.Imprime;

  end T1;
  task body T2 is
  begin
    accept Preenche;
      B := Trabalho.Preenche(Arr,I2,19,'b');
      T3.Preenche;
    accept Imprime;
      I2 := 10;
      B := Trabalho.Imprime(Arr,I2,19);
      T3.Imprime;
  end T2;
  task body T3 is
  begin
    accept Preenche;
      B := Trabalho.Preenche(Arr,I3,29,'c');
      T1.Imprime;
    accept Imprime;
      I3 := 20;
      B := Trabalho.Imprime(Arr,I3,29);
  end T3;
begin
  T1.Preenche;
end main;
