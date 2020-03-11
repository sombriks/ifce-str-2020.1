with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with MyArray;
with Trabalho;

procedure main is
   Arr : MyArray.ArrArr := ('?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?');
    -- declarando as tasks
  --  task T1;
  --  task T2;
  --  task T3;
   B : Boolean;
   I : Integer := 0;
begin
  B := Trabalho.Imprime(Arr,0,29);
  B := Trabalho.Preenche(Arr,I,29,'a');
  B := Trabalho.Imprime(Arr,0,29);
end main;
