-- RENT A CAR - ÖRNEK VERİLER (MOCK DATA)
USE rent_a_car_db;

-- 1. Temel Araç ve Şube Verileri (Test için gereklidir)
INSERT INTO Sube (sub_Ad, sub_Sehir) VALUES ('Merkez Şube', 'Bursa'), ('Havalimanı Şube', 'İstanbul');
INSERT INTO Marka (mar_Ad) VALUES ('Renault'), ('Ford');
INSERT INTO Model (mar_ID, mod_Ad) VALUES (1, 'Clio'), (2, 'Focus');
INSERT INTO Arac_Sinif (sin_Ad, sin_GunlukFiyat) VALUES ('Ekonomik', 850.00), ('Orta Sınıf', 1200.00);
INSERT INTO Arac (ara_Plaka, ara_GuncelKm, mod_ID, sin_ID, sub_ID) VALUES 
('16 ABC 123', 45000, 1, 1, 1), 
('34 XYZ 987', 22000, 2, 2, 2);

-- 2. BENİM MODÜLÜM: Müşteri Verileri
INSERT INTO Musteri (mus_Ad, mus_Soyad, mus_TC, mus_EhliyetNo) VALUES
('Ahmet', 'Yılmaz', '12345678901', 'EHL-1001'),
('Ayşe', 'Kaya', '10987654321', 'EHL-1002'),
('Mehmet', 'Demir', '11223344556', 'EHL-1003');

-- 3. BENİM MODÜLÜM: Ekstra Hizmetler
INSERT INTO Ekstra_Hizmet (eks_Ad, eks_GunlukFiyat) VALUES
('Bebek Koltuğu', 150.00),
('Ek Şoför', 300.00),
('Navigasyon (GPS)', 100.00),
('Tam Kapsamlı Sigorta', 500.00);

-- 4. BENİM MODÜLÜM: Araç Bakım Kayıtları
INSERT INTO Bakim_Kaydi (ara_ID, bak_Tarihi, bak_Aciklama) VALUES
(1, '2026-01-15', '10.000 KM Periyodik Bakım (Yağ ve Filtre Değişimi)'),
(1, '2026-06-20', 'Fren Balata Değişimi'),
(2, '2026-03-10', '30.000 KM Ağır Bakım');

-- 5. BENİM MODÜLÜM: Araç Hasar Kayıtları
INSERT INTO Hasar_Kaydi (ara_ID, has_Tarihi, has_Maliyet) VALUES
(1, '2026-02-10', 4500.00),
(2, '2026-05-05', 12500.00);

-- 6. BENİM MODÜLÜM: Trafik Cezaları
INSERT INTO Trafik_Cezasi (ara_ID, cez_Tarihi, cez_Tutar) VALUES
(1, '2026-02-05', 1506.00),
(2, '2026-07-12', 951.00),
(2, '2026-08-21', 427.00);