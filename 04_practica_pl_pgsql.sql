-- EJERCICIOS
/*
1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota.*/
do $$
declare nota integer:=9;
begin
 case nota
    when 10 then
    when 9 then
	   raise notice 'A';
	when 8 then
    when 7 then
	   raise notice 'B';
	when 6 then
	   raise notice 'C';
    when 5 then
	   raise notice 'D';
	when 4 then
    when 3 then
	   raise notice 'E';
	when 2 then
    when 1 then
	   raise notice 'F';
 end case;
end $$ language 'plpgsql'
/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.*/
do $$
declare numero1 integer:=6;
begin
 raise notice 'Tabla de multiplicar del %' , numero1;
   for i in 0..10 loop
      raise notice '% x % = %', numero1, i, numero1*i;
   end loop;

end $$ language 'plpgsql'

/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.*/
do $$
declare 
	dolares integer:=2;
	tasa_cambio numeric:=0.91;
begin
 raise notice '% dolares equivale a % euros', dolares, dolares*tasa_cambio;
end $$ language 'plpgsql'	
/*
4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.*/
do $$
declare monto numeric:=15000;
	    meses integer:=240;
        tasa_interes numeric:=0.82;
		tasa_mensual numeric;
        factor numeric; 
        cuota numeric;
begin
  tasa_mensual := tasa_interes / 12;
  factor := (tasa_mensual * pow(1 + tasa_mensual, meses)) / (pow(1 + tasa_mensual, meses) - 1);
  cuota := monto * factor;
  raise notice 'La cuota es %', cuota;

end $$ language 'plpgsql'
