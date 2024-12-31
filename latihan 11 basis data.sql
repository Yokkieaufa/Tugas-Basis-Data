--Transaction
--sebelumnya jalankan perintah
start transaction;

--Insert ke dalam table bukutamu
insert into bukutamu(email, title, content)
values('transaction1@gmail.com', 'Transaction', 'Ini Transaksi');
ROLLBACK;

insert into bukutamu(email, title, content)
values('transaction2@gmail.com', 'Transaction', 'Ini Transaksi 2');

insert into bukutamu(email, title, content)
values('transaction3@gmail.com', 'Transaction', 'Ini Transaksi 3');

insert into bukutamu(email, title, content)
values('transaction4@gmail.com', 'Transaction', 'Ini Transaksi 4');

insert into bukutamu(email, title, content)
values('transaction5@gmail.com', 'Transaction', 'Ini Transaksi 5');

--gunakan lain client untuk melihatnya
select * from bukutamu;

--comit untuk melihat hasilnya di beda client
commit;

--Menggunakan rollback
start transaction;
--Insert ke dalam table bukutamu
insert into bukutamu(email, title, content)
values('transaction@gmail.com', 'Transaction1', 'Ini rollback');

insert into bukutamu(email, title, content)
values('transaction@gmail.com', 'Transaction2', 'Ini rollback 2');

insert into bukutamu(email, title, content)
values('transaction@gmail.com', 'Transaction3', 'Ini rollback 3');

insert into bukutamu(email, title, content)
values('transaction@gmail.com', 'Transaction4', 'Ini rollback 4');

insert into bukutamu(email, title, content)
values('transaction@gmail.com', 'Transaction5', 'Ini rolback 5');

select * from bukutamu;

--cek dilain client
select * from bukutamu

--gunakan rollback untuk membatalkan
rollback;

--LOCKING
--menggunakan di table products
select * from products;
--sebelumnya start transaction terlebih dahulu
start transaction;
--update di field id
update products
set keterangan = 'Ayam geprek original muda banget'
where id = 'P0001';
--cek table products
select * from products
where id = 'P0001';

--cek di lain client untuk update jumlah p001
update products set jumlah = 200 where id = 'P0001';

--jalankan commit untuk melepas lock
commit;

--locking record manual
start transaction;

select * from products where id = 'P0001' for update;

--select di beda client
select * from products set harga = 30000 
where id = 'P0001' for update;
--membatalkan
rollback;

--DEADLOCK
start transaction;

select * from products where id = 'P0001' for update;

select * from products where id = 'P0002' for update;

rollback;

select * from products
where id = 'P0001';

--schema
--melihat scema
select current_schema();

--membuat scema
create schema latihan;
--menghapus schema
drop schema contoh;
--pindah schema
set search_path to contoh;
--melihat schema saat ini
select current_schema();

select * from public.products;
create table latihan.products
(
	id	serial	not null,
	nama	varchar(100) not null,
	primary key(id)
);

select * from latihan.products;

--pindah schema public
set search_path to public;

--jika insert di schema contoh pada path public
insert into latihan.products(nama)
values ('Samsung'),
		('Lenovo');

select * from latihan.products;

--USER MANAGEMENT
--membuat users
create role arief;
create role banyu;

--menghapus
drop role arief;
drop role banyu;

--membuat user role yang sudah dibuat
alter role arief login password 'rahasia';
alter role banyu login password 'rahasia';

--hak akses
grant insert, update, select on all table in schema public to arief;
grant insert, update, select on customer to banyu;

--psql --host=localhost --port=5432 --dbname=latihan1 --username=arief --pasword
--backup database
--cek pg dump apakah sudah terinstall
pg_dump --help

pg_dump --host=localhost --port=5432 --dbname=belajar --username=arief --format=lain --file=/home/documnets/backup.sql

--restore database

