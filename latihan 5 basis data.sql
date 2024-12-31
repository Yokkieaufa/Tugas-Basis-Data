

select * from products;

--Delete Data
--insert data untuk contoh dihapus
insert into products(id, nama, harga, jumlah, category)
values ('P0010', 'Produk Gagal', 50000, 100,'Minuman');

select * from products;

--Menghapus id P0010
delete from products
where id = 'P0010';

--Alias / membuat nama lain
select id as kode, harga as price, keterangan as deskripsi from products;

--alias jika lebih dari 1 suku kata
select id as "kode barang", harga as price, keterangan as deskripsi from products;

--alias untuk tabel
select p.id as "kode barang",
		p.harga as "harga barang",
		p.keterangan as "Deskripsi barang"
from products as p;

--where operator

select * from products;

--Mencari dengan operator perbandingan lebih dari
select * from products where harga > 15000;

--Mencari dengan operator perbandingan kurang dari
select * from products where harga <= 30000;

select * from products where category != 'Minuman';

--Operator AND dan OR
select * from products where harga > 20000 and category = 'Makanan';


--menambahkan category minuman
insert into products(id , nama , harga, jumlah, category)
values ('P0006', 'Air Tawar', 2000, 100, 'Minuman'),
		('P0007', 'Es Tawar', 5000, 100, 'Minuman'),
		('P0008', 'Es Teller', 20000, 100, 'Minuman'),
		('P0009', 'Es Janda muda', 25000, 100, 'Minuman');


select * from products;

--Mencari dibawah harga
select * from products where harga > 15000;

--Mencari dibawah
select * from products where harga  > 15000 and category = 'Minuman';

--OPERATOR OR
select * from products where harga > 1500 or category = 'Makanan';

--Prioritas menggunakan tanda ()
select * from products where jumlah > 100 or category = 'Makanan' and harga > 15000;

select * from products where category = 'Makanan' or (jumlah > 100) and harga > 15000;
--Latihan pertemuan 5

--like operator
select * from products where nama ilike '%mie%';

select * from products where nama ilike '%bakso%';

select * from products where nama like '%Es%';
select * from products;

--Null Operator
select * from products where keterangan is null;

select * from products where keterangan is not null;


--between operator
select * from products where harga between 10000 and 30000;


select * from products where harga not between 10000 and 30000;

--IN operator
select * from products where category in ('Makanan');

select * from products where category in ('Makanan', 'Minuman');

--Order By clause
select * from products order by harga asc;

select * from products order by harga asc, id desc;

select * from products order by harga desc;

--limit clouse / membatasi data yang ditampilkan
select * from products where harga > 0 order by harga asc, id desc limit 2;

--skip data yg ditampilkan dengan offset (biasanya untuk pagging)
--contoh 1 limit 2 offset 0, 2 limit 2 offset 2, 3 limit 2 offset 4

select * from products order by harga asc, id desc limit 2 offset 2;

--select distinct data / menghilangkan duplikat
select category from products;

select distinct category from products;

--numeric function
select 10 + 10 as hasil;

select id, harga / 1000 as harga_in_k from products;

--mathematik function
select pi();

select power(10, 2);

select cos(10), sin(10), tan(10);

select id, nama, power(jumlah, 2) as jumlah_power_2 from products;

--auto increment
--membuat table admin
create table admin(
	id serial not null,
	nama_depan varchar(100) not null,
	nama_belakang varchar(100) not null,
	primary key(id)
);

--input data
INSERT INTO admin (id, nama_depan, nama_belakang)
VALUES 
    (1, 'Rohmat', 'Arief'),
    (2, 'Joko', 'Prabowo'),
    (3, 'Mega', 'Wanto');

);

select * from admin;

--melihat id terakhir
select currval('admin_id_seq');


SELECT currval('admin_id_seq');

--sequence
--Membuat sequence
create sequance contoh_berurut;


--melihat id terakhir
SELECT nextval('contoh_berurut');


--melihat saat ini diurutan berapa
select currval('contoh_berurut');

--String function
SELECT id, nama, keterangan FROM products;

SELECT id, lower(nama), length(nama), lower(keterangan) 
FROM products;

--date dan time function



