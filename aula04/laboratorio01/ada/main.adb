-- cópia da versão em C
with Ada.Text_IO; -- module import
with Ada.Integer_Text_IO;

use Ada.Text_IO; -- namespace import
use Ada.Integer_Text_IO;

procedure main is
   --
   -- fase de declaração
   --

   -- índice do array
   I : Integer := 0; 
   
   -- array de caracteres
   Arr : String := "??????????????????????????????";
   
   -- array de flags (sim, isso mesmo, x_x)
   type FlgsIdx is range 0 .. 2;
   type FlgsVal is range 0 .. 1;
   type FlgsArr is array (FlgsIdx) of FlgsVal;
   Flgs : FlgsArr := (0,1,1);
   
   -- estrutura contexto para as três linhas de execução
   type Ctx is Record
      Flg : FlgsIdx;
      Next : Integer;
      ToWrite : Character;
      Max : FlgsIdx;
   end Record;

   -- corpo de thread
   function Trabalho (Contexto : Ctx; I : Integer) return Integer is
      Noop : Integer;
   begin
      while I <= Contexto.Max loop
         -- laço busy-wait
         while Flgs(Contexto.Flg) = 1 loop
            -- busy wait
            Noop := 1; -- somos obrigados a colocar alguma coisa aqui
         end loop;

         -- escrever no array
         Arr(I) := Contexto.ToWrite;
         I := I + 1;
         -- subir a própria flag
         Flgs(Contexto.Flg) := 1;
         -- descer a flag da thread seguinte
         Flgs(Contexto.Next) := 0;
      end loop;
      return 0;
   end trabalho;

   -- a correta configuração do contexto é importante
   C1 : Ctx := (0,1,'a',27);
   C2 : Ctx := (1,2,'b',28);
   C3 : Ctx := (2,0,'c',29);
   
begin
   --
   -- fase de execução
   --

   Put_Line(Arr);
end main;
-- 