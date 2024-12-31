
--mengambil data product
	select * from products;

--mengambil data products randum
select id, nama, harga from products;


select * from products;

select id, harga from products;

--menambahkan colom primary key untuk tabel yang telah dibuat
alter table products
add primary key (id);





--where clause
select id, nama, harga, jumlah from products
where jumlah = 0;

select id, nama, harga, jumlah from products
where harga = 20000;

select id, nama, harga, jumlah from products
where id = 'P004';

--menambahkan product category
create type PRODUCT_CATEGORY as enum ('Makanan', 'Minuman', 'Lain-lain');

--Menambahkan column category
alter table products
add column category PRODUCT_CATEGORY;

--Mengupdate table pada column category
update products
set category = 'Makanan'
where id = 'P0001';

select * from products;

update products
set category = 'Makanan'
where id = 'P0002';

update products
set category = 'Makanan'
where id = 'P0003';

update products
set category = 'Makanan'
where id = 'P0004';

update products
set category = 'Makanan'
where id = 'P0005';

--mengubah value di colomn
update products
set harga = harga + 10000
where id = 'P0009';

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
select * from products where harga > 15000 or category = 'Makanan';

--Prioritas menggunakan tanda ()
select * from products where jumlah > 100 or category = 'Makanan' and harga > 15000;

select * from products where category = 'Makanan' or (jumlah > 100) and harga > 15000;

--like operator
