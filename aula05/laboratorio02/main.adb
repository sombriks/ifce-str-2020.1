with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with MyArray;
with Trabalho;

procedure main is

   B : Boolean;

   I1 : Integer := 0;
   I2 : Integer := 10;
   I3 : Integer := 20;
   -- flags do bisueitilupifleg
   F1 : Integer := 0;
   F2 : Integer := 0;
   F3 : Integer := 0;
   -- 30 posições
   Arr : MyArray.ArrArr := ('?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?');
    -- declarando as tasks
   task T1;
   task T2;
   task T3;
  -- body das tasks
  task body T1 is
  begin
      -- busy wait
      while F1 = 0 loop 
        null;
      end loop;
      B := Trabalho.Preenche(Arr,I1,9,'a');
      F1 := 0; 
      F2 := 1;
      while F1 = 0 loop 
        null;
      end loop;
      I1 := 0;
      B := Trabalho.Imprime(Arr,I1,9);
      F2 := 1;
  end T1;
  task body T2 is
  begin
      -- busy wait
      while F2 = 0 loop 
        null;
      end loop;
      B := Trabalho.Preenche(Arr,I2,19,'b');
      F2 := 0;
      F3 := 1;
      while F2 = 0 loop 
        null;
      end loop;
      I2 := 10;
      B := Trabalho.Imprime(Arr,I2,19);
      F3 := 1;
  end T2;
  task body T3 is
  begin
      while F3 = 0 loop 
        null;
      end loop;
      B := Trabalho.Preenche(Arr,I3,29,'c');
      F3 := 0;
      F1 := 1;
      while F3 = 0 loop 
        null;
      end loop;
      I3 := 20;
      B := Trabalho.Imprime(Arr,I3,29);
  end T3;
begin
  F1 := 1;
end main;
