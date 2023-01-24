/*==================================SELECT-REGEXP_LIKE=============================================
 Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.
  
-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[])
=========================================================================================*/
use sys;
CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 7);
    INSERT INTO kelimeler VALUES(1016, 'h-t', 3);
    INSERT INTO kelimeler VALUES(1017, 'h?t', 3);
    INSERT INTO kelimeler VALUES(1018, 'hOOOt', 5);
    INSERT INTO kelimeler VALUES(1019, 'O', 1);
SELECT * FROM kelimeler;

-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat ederek listele
	-- NOT: VEYA islemi icin | karakteri kullanilir.
    select kelime
    from kelimeler
    where regexp_like(kelime,'ot|at','c');
    
    -- Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat etmeksizin listele
    
    select kelime
    from kelimeler
    where regexp_like(kelime,'ot|at','i');
    
    -- Q3 : 'ho' veya 'hi' ile baslayan kelimeleri case-sensitive'e dikkat etmeksizin listele
    -- NOT: Baslangici gostermek icin ^ karakteri kullanilir.

 select kelime
    from kelimeler
    where regexp_like(kelime,'^ho|^hi','i');
    
    -- Q4 : Sonu 't' veya 'm' ile bitenleri case-sensitive'e dikkat etmeksizin listele
    -- NOT: Bitisi gostermek icin $ karakteri kullanilir.
    select kelime
    from kelimeler
    where regexp_like(kelime,'t$|m$','i');
    
    -- Q5 : h ile baslayip t ile biten 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
	-- NOT : [!-~] = [a-zA-Z0-9]
    
    select kelime
    from kelimeler
    where regexp_like(kelime,'h[!-~]t','c');
    
    select kelime
    from kelimeler
    where regexp_like(kelime,'h[a-z]t','c');
    
     select kelime
    from kelimeler
    where regexp_like(kelime,'h[A-Z]t','c');
    
     select kelime
    from kelimeler
    where regexp_like(kelime,'h[0-9]t','c');
    
    select kelime
    from kelimeler
    where kelime like 'h_t'; -- case sensitive değil
    
    -- Q6 : 2. harfi O olan 3 harfli kelimeleri (o harfi buyuk olanlari) listeleyiniz
    select kelime, id
    from kelimeler
    where regexp_like(kelime,'^.[O][!-~]$','c');
    
    -- Q7 : 2. ve 3. harfi o olan tum kelimeleri (case sensitive olmaksizin) listeleyiniz
    select kelime
    from kelimeler
    where regexp_like(kelime,'[!-~]oo[!-~]','i');
    
    
    
    

