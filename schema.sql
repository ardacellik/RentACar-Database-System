-- Rent A Car Veritabanı Şeması
CREATE DATABASE IF NOT EXISTS rent_a_car_db;
USE rent_a_car_db;

-- 1. YÖNETİM VE ORGANİZASYON
CREATE TABLE Sube (
    sub_ID INT AUTO_INCREMENT PRIMARY KEY,
    sub_Ad VARCHAR(100) NOT NULL,
    sub_Sehir VARCHAR(50),
    sub_Tel VARCHAR(15)
);

CREATE TABLE Personel_Rol (
    rol_ID INT AUTO_INCREMENT PRIMARY KEY,
    rol_Ad VARCHAR(50) NOT NULL
);

CREATE TABLE Personel (
    per_ID INT AUTO_INCREMENT PRIMARY KEY,
    sub_ID INT,
    rol_ID INT,
    per_Ad VARCHAR(50) NOT NULL,
    per_Soyad VARCHAR(50) NOT NULL,
    FOREIGN KEY (sub_ID) REFERENCES Sube(sub_ID),
    FOREIGN KEY (rol_ID) REFERENCES Personel_Rol(rol_ID)
);

CREATE TABLE Kampanya (
    kam_ID INT AUTO_INCREMENT PRIMARY KEY,
    kam_Ad VARCHAR(100),
    kam_IndirimYuzdesi DECIMAL(5,2)
);

-- 2. ARAÇ FİLOSU VE ENVANTER
CREATE TABLE Marka (
    mar_ID INT AUTO_INCREMENT PRIMARY KEY,
    mar_Ad VARCHAR(50) NOT NULL
);

CREATE TABLE Model (
    mod_ID INT AUTO_INCREMENT PRIMARY KEY,
    mar_ID INT,
    mod_Ad VARCHAR(50) NOT NULL,
    FOREIGN KEY (mar_ID) REFERENCES Marka(mar_ID)
);

CREATE TABLE Arac_Sinif (
    sin_ID INT AUTO_INCREMENT PRIMARY KEY,
    sin_Ad VARCHAR(50),
    sin_GunlukFiyat DECIMAL(10,2) NOT NULL
);

CREATE TABLE Arac (
    ara_ID INT AUTO_INCREMENT PRIMARY KEY,
    ara_Plaka VARCHAR(15) UNIQUE NOT NULL,
    ara_GuncelKm INT,
    mod_ID INT,
    sin_ID INT,
    sub_ID INT,
    FOREIGN KEY (mod_ID) REFERENCES Model(mod_ID),
    FOREIGN KEY (sin_ID) REFERENCES Arac_Sinif(sin_ID),
    FOREIGN KEY (sub_ID) REFERENCES Sube(sub_ID)
);

-- 3. BENİM GELİŞTİRDİĞİM MODÜLLER (Operasyon & Araç Yaşam Döngüsü)
CREATE TABLE Bakim_Kaydi (
    bak_ID INT AUTO_INCREMENT PRIMARY KEY,
    ara_ID INT,
    bak_Tarihi DATE,
    bak_Aciklama TEXT,
    FOREIGN KEY (ara_ID) REFERENCES Arac(ara_ID)
);

CREATE TABLE Hasar_Kaydi (
    has_ID INT AUTO_INCREMENT PRIMARY KEY,
    ara_ID INT,
    has_Tarihi DATE,
    has_Maliyet DECIMAL(10,2),
    FOREIGN KEY (ara_ID) REFERENCES Arac(ara_ID)
);

CREATE TABLE Trafik_Cezasi (
    cez_ID INT AUTO_INCREMENT PRIMARY KEY,
    ara_ID INT,
    cez_Tarihi DATE,
    cez_Tutar DECIMAL(10,2),
    FOREIGN KEY (ara_ID) REFERENCES Arac(ara_ID)
);

CREATE TABLE Musteri (
    mus_ID INT AUTO_INCREMENT PRIMARY KEY,
    mus_Ad VARCHAR(50) NOT NULL,
    mus_Soyad VARCHAR(50) NOT NULL,
    mus_TC VARCHAR(11) UNIQUE,
    mus_EhliyetNo VARCHAR(20) UNIQUE
);

CREATE TABLE Ekstra_Hizmet (
    eks_ID INT AUTO_INCREMENT PRIMARY KEY,
    eks_Ad VARCHAR(100),
    eks_GunlukFiyat DECIMAL(10,2)
);

CREATE TABLE Kiralama_Ekstra_Detay (
    det_ID INT AUTO_INCREMENT PRIMARY KEY,
    soz_ID INT,
    eks_ID INT,
    FOREIGN KEY (eks_ID) REFERENCES Ekstra_Hizmet(eks_ID)
);