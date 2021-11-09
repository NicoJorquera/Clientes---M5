-- Ejercicio 2
begin;
insert into public.compra values (33, 1, CURRENT_DATE); -- el 33 es la siguiente compra, ya que la ultima registrada es la 32 de la misma tabla
insert into public.detalle_compra values (43, 9, 33, 5); -- el 43 es el sig detalle, al igual que el caso de compra.
update public.producto set stock = stock - 5 where id = 9;
commit; -- una vez que se termina la transaccion, se debe hacer un commit.

rollback;
select * from public.producto;
-- R: La transacción no se completó puesto que el stock inicial del producto9 es 4.
-- R: No se descontó el stock en producto.

-- Ejercicio 3
begin;
-- Producto 1
insert into public.compra values (33, 2 , CURRENT_DATE);
insert into public.detalle_compra values (43, 1, 33, 3); -- (detalle_compra, producto1, compra, cantidad)
update public.producto set stock = stock - 3 where id = 1;
commit;

select * from public.producto;
select * from public.compra;
select * from public.detalle_compra;

-- Producto 2
begin;
insert into public.compra values (34, 2, CURRENT_DATE);
insert into public.detalle_compra values (44, 2, 34, 3);
update public.producto set stock = stock - 3 where id = 2;
commit;

select * from public.producto;
select * from public.compra;
select * from public.detalle_compra;

-- Producto 8
begin;
insert into public.compra values (35, 2, CURRENT_DATE);
insert into public.detalle_compra values (45, 8, 35, 3);
update public.producto set stock = stock - 3 where id = 8;
commit;

rollback;
select * from public.producto;
-- No se completó la transacción del producto8, puesto que su stock inicial es 0.

-- Ejercicio 4
\echo :AUTOCOMMIT -- vemos el estado 

\set AUTOCOMMIT off -- deshabilito el autocommit

-- cuando te pidan una transaccion, es necesario el begin con un commit.
-- Aqui no nos pide aquello, solo agregar el cliente
INSERT INTO public.cliente VALUES (11, 'usuario11', 'usuario11@gmail.com');
SELECT * FROM public.cliente WHERE id = 11;
ROLLBACK;

SELECT * FROM public.cliente WHERE id = 11;

\set AUTOCOMMIT on -- habilito el autocommit