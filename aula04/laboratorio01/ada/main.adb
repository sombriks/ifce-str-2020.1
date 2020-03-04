-- cópia da versão em C
with Ada.Text_IO; -- module import
with Ada.Integer_Text_IO;

use Ada.Text_IO; -- namespace augmentation
use Ada.Integer_Text_IO;

procedure main is
   --
   -- fase de declaração
   --
   -- índice do array
   I : Integer := 0;
   -- array de caracteres
   type ArrIdx is range 0 .. 29;
   type ArrVal is ('?','a','b','c');
   type ArrArr is array (ArrIdx) of ArrVal;
   Arr : ArrArr := ('?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?');
   -- array de flags 
   type FlgsIdx is range 0 .. 2;
   type FlgsVal is range 0 .. 1;
   type FlgsArr is array (FlgsIdx) of FlgsVal;
   Flgs : FlgsArr := (0,1,1);
   -- estrutura contexto para as três linhas de execução
   type Ctx is Record
      Flg : FlgsIdx;
      Next : FlgsIdx;
      ToWrite : ArrVal;
      Max : Integer;
   end Record;
   -- corpo de thread
   function Trabalho (Contexto : Ctx) return Integer is
      Noop : Integer;
   begin
      Put_Line("Task " & Integer'Image(Integer(Contexto.Flg)) & " iniciada");
      while I <= Integer(Contexto.Max) loop
         -- laço busy-wait
         while Flgs(Contexto.Flg) = 1 loop
            -- busy wait
            Noop := 1; -- somos obrigados a colocar alguma coisa aqui
         end loop;
         Put_Line("Task " & Integer'Image(Integer(Contexto.Flg)) & " escrevendo em " & Integer'Image(I));
         -- escrever no array
         Arr(ArrIdx(I)) := Contexto.ToWrite;
         I := I + 1;
         -- subir a própria flag
         Flgs(Contexto.Flg) := FlgsVal(1);
         -- descer a flag da thread seguinte
         Flgs(Contexto.Next) := FlgsVal(0);
      end loop;
      Put_Line("Task " & Integer'Image(Integer(Contexto.Flg)) & " saindo");
      return 0;
   end trabalho;
   -- a correta configuração do contexto é importante
   C1 : Ctx := (0,1,'a',27);
   C2 : Ctx := (1,2,'b',28);
   C3 : Ctx := (2,0,'c',29);
   -- declarando as tasks
   task T1;
   task T2;
   task T3;
   -- declarando o corpo das tasks
   task body T1 is
      N : Integer;
   begin
      N := Trabalho(C1);
   end T1;
   task body T2 is
      N : Integer;
   begin
      N := Trabalho(C2);
   end T2;
   task body T3 is
      N : Integer;
   begin
      N := Trabalho(C3);
   end T3;
begin
   --
   -- fase de execução
   --
   for I in ArrIdx loop
      Put(ArrVal'Image(Arr(I)));
   end loop;
   Put_Line("");
   -- fazendo o corpo da task main esperar a conclusão das filhas
   null;
   delay 2.0;
   for I in ArrIdx loop
      Put(ArrVal'Image(Arr(I)));
   end loop;
   Put_Line("");
end main;
-- 