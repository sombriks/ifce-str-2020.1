package MyArray is
  -- array de caracteres
   type ArrIdx is range 0 .. 29;
   type ArrVal is ('?','a','b','c');
   type ArrArr is array (ArrIdx) of ArrVal;
end MyArray;