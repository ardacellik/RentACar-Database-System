-- RENT A CAR - SORGULAR
USE rent_a_car_db;

-- 1. Araç Hasar Raporu
SELECT 
    a.ara_Plaka, 
    COUNT(h.has_ID) AS Toplam_Kaza_Sayisi, 
    COALESCE(SUM(h.has_Maliyet), 0) AS Toplam_Hasar_Maliyeti
FROM Arac a
LEFT JOIN Hasar_Kaydi h ON a.ara_ID = h.ara_ID
GROUP BY a.ara_ID, a.ara_Plaka
ORDER BY Toplam_Hasar_Maliyeti DESC;

-- 2. Araç Operasyon Geçmişi
SELECT 
    a.ara_Plaka, 
    b.bak_Tarihi AS Islem_Tarihi, 
    b.bak_Aciklama AS Detay, 
    'Bakım Girdi' AS Islem_Tipi
FROM Arac a
INNER JOIN Bakim_Kaydi b ON a.ara_ID = b.ara_ID
UNION
SELECT 
    a.ara_Plaka, 
    c.cez_Tarihi AS Islem_Tarihi, 
    CONCAT(c.cez_Tutar, ' TL Ceza Yedi') AS Detay, 
    'Trafik Cezası' AS Islem_Tipi
FROM Arac a
INNER JOIN Trafik_Cezasi c ON a.ara_ID = c.ara_ID
ORDER BY Islem_Tarihi DESC;

-- 3. Şube Bazlı Ceza Raporu
SELECT 
    s.sub_Ad AS Sube_Adi,
        COUNT(c.cez_ID) AS Toplam_Ceza_Adedi,
    SUM(c.cez_Tutar) AS Toplam_Ceza_Maliyeti
FROM Sube s
INNER JOIN Arac a ON s.sub_ID = a.sub_ID
INNER JOIN Trafik_Cezasi c ON a.ara_ID = c.ara_ID
GROUP BY s.sub_ID, s.sub_Ad;