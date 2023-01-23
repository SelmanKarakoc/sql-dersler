/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.
USE sys;
CREATE TABLE fen_lisesi(
okul_no INT UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(50),
son_degisiklik_tarihi DATE
);
SELECT * FROM fen_lisesi;
INSERT INTO fen_lisesi VALUES (101, 'Mehmet Dag', 4.5, 'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102, 'Berrin Hanim', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (103, 'Mehmet Erden', 3.9, 'Izmir','2023-01-19');
INSERT INTO fen_lisesi VALUES (104, 'Sinan Bey', 4.7, 'Istanbul','2023-01-20');
INSERT INTO fen_lisesi VALUES (105, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (106, 'Gulhayat Guder', 4.3, 'Izmir','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, 'Berivan Gencdal', 4.3, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (108, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Selman Karakoç', null, null,null);
INSERT INTO fen_lisesi (isim, adres) VALUES ('Abdullah Ak', 'İstanbul');
INSERT INTO fen_lisesi (okul_no,isim, adres) VALUES (109, 'Yücel Bey','İstanbul');

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder,
-- diger kayitlarda duplicate hatasi verir.


/* ----------------------------------------------
Q1 : okul_no, isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */
create table anadolu_lisesi(
okul_no char(4) unique,
isim varchar(20) not null,
adres varchar(25),
derece double
);
drop table anadolu_lisesi;
select * from anadolu_lisesi;

insert into anadolu_lisesi values('1001','Ayse Nuriye','İstanbul',4.7);
insert into anadolu_lisesi values('1002','Zafer Bey','Ankara',4.6);
insert into anadolu_lisesi values('1003','Furkan Veli İnal','İstanbul',3.9);
insert into anadolu_lisesi values('1004','Humeyra Uysal','İzmir',4.8);
insert into anadolu_lisesi values('1005','Mehmet Harun','İstanbul',3.8);
insert into anadolu_lisesi values(null,'Berivan Gençdal','İzmir',4.8);
insert into anadolu_lisesi values(null,'İlyas Bey ','İstanbul',3.7);
insert into anadolu_lisesi values('1006','Neo Bey','İstanbul',3.8);
insert into anadolu_lisesi (isim, adres) values('Berrin Hanım','Ankara');
insert into anadolu_lisesi (okul_no,isim, derece) values('1007','Ersin Bey','4.5');


