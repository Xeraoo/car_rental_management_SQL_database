-- SQL for the Wypozyczalnia

BEGIN TRANSACTION;
DROP TABLE IF EXISTS Administracja;
DROP TABLE IF EXISTS Samochody;
DROP TABLE IF EXISTS Parametry_Pojazdu;
DROP TABLE IF EXISTS Usterki; 
DROP TABLE IF EXISTS Recenzje;
DROP TABLE IF EXISTS Klienci;
DROP TABLE IF EXISTS Potwierdzenie_Tozsamosci_Klienta;
DROP TABLE IF EXISTS Wlasciciel_Pojazdu;
DROP TABLE IF EXISTS Potwierdzenie_Tozsamosci_Wlasciciela;
DROP TABLE IF EXISTS Platnosc;
DROP TABLE IF EXISTS Wynajem;
DROP TABLE IF EXISTS Zdjecia_Pojazdu;
DROP TABLE IF EXISTS Rezerwacja;

CREATE TABLE Administracja(id_administracji INTEGER NOT NULL PRIMARY KEY, Imie TEXT NOT NULL, Nazwisko TEXT NOT NULL, Adres_Kontaktowy TEXT NOT NULL, Nazwa_Uzytkownika TEXT NOT NULL UNIQUE, Haslo TEXT NOT NULL UNIQUE); 

INSERT INTO Administracja(id_administracji, Imie, Nazwisko, Adres_Kontaktowy, Nazwa_Uzytkownika, Haslo) VALUES (1, 'T', 'M', 't@gmail.pl', 'X', 'SuperPieski');
INSERT INTO Administracja(id_administracji, Imie, Nazwisko, Adres_Kontaktowy, Nazwa_Uzytkownika, Haslo) VALUES (2, 'F', 'K', 'coconoon@gmail.pl', 'F', 'Pjeski');
INSERT INTO Administracja(id_administracji, Imie, Nazwisko, Adres_Kontaktowy, Nazwa_Uzytkownika, Haslo) VALUES (3, 'N', 'M', 'n@gmail.pl', 'Da', 'Z');
INSERT INTO Administracja(id_administracji, Imie, Nazwisko, Adres_Kontaktowy, Nazwa_Uzytkownika, Haslo) VALUES (4, 'W', 'D', 'Wdz@gmail.pl', 'K', 'K');
NSERT INTO Administracja(id_administracji, Imie, Nazwisko, Adres_Kontaktowy, Nazwa_Uzytkownika, Haslo) VALUES (5, 'M', 'P', 'P@gmail.pl', 'C', 'D');

CREATE TABLE Klienci(id_Klienta INTEGER NOT NULL PRIMARY KEY, Imie TEXT NOT NULL, Nazwisko TEXT NOT NULL, Plec CHAR NOT NULL CHECK (Plec IN ('M', 'K')), Adres_email TEXT NOT NULL, Konto_Facebook TEXT NOT NULL UNIQUE, Adres_zamieszknia TEXT NOT NULL, Kod_Pocztowy TEXT NOT NULL, Nazwa_Uzytkownika TEXT NOT NULL UNIQUE, Haslo TEXT NOT NULL UNIQUE, id_administracji_k INTEGER NOT NULL, Status_Konta TEXT NOT NULL CHECK (Status_Konta IN ('Aktywne', 'Nieaktywne')), FOREIGN KEY (id_administracji_k) REFERENCES Administracja(id_administracji));

INSERT INTO Klienci (id_Klienta, Imie, Nazwisko, Plec, Adres_email, Konto_Facebook, Adres_zamieszknia, Kod_Pocztowy, Nazwa_Uzytkownika, Haslo, id_administracji_k, Status_Konta) VALUES (1, 'E', 'W', 'K', 'ea@student.agh.edu.pl', 'E', 'S', '4', 'e', 'he', 1, 'Aktywne');
INSERT INTO Klienci (id_Klienta, Imie, Nazwisko, Plec, Adres_email, Konto_Facebook, Adres_zamieszknia, Kod_Pocztowy, Nazwa_Uzytkownika, Haslo, id_administracji_k, Status_Konta) VALUES (2, 'Mi', 'Scz', 'M', 's@wp.pl', 'M', 'M', '3', 'br', 'b3', 2, 'Nieaktywne');
INSERT INTO Klienci (id_Klienta, Imie, Nazwisko, Plec, Adres_email, Konto_Facebook, Adres_zamieszknia, Kod_Pocztowy, Nazwa_Uzytkownika, Haslo, id_administracji_k, Status_Konta) VALUES (3, 'K', 'Juz', 'K', 'kz@02.pl', 'Ka', 'M', '87', 'Ja', 'T5', 3, 'Nieaktywne');
INSERT INTO Klienci (id_Klienta, Imie, Nazwisko, Plec, Adres_email, Konto_Facebook, Adres_zamieszknia, Kod_Pocztowy, Nazwa_Uzytkownika, Haslo, id_administracji_k, Status_Konta) VALUES (4, 'W', 'yn', 'K', 'n@gmail.com', 'n', 'C', '4400', 'Na', 'S', 4, 'Aktywne');
INSERT INTO Klienci (id_Klienta, Imie, Nazwisko, Plec, Adres_email, Konto_Facebook, Adres_zamieszknia, Kod_Pocztowy, Nazwa_Uzytkownika, Haslo, id_administracji_k, Status_Konta) VALUES (5, 'Al', 'S', 'K', 's@02.pl', 'Icx', 'C1', '32-250', 'Ied', 'O4', 5, 'Aktywne');


CREATE TABLE Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia INTEGER NOT NULL PRIMARY KEY, Nazwa_Potwierdzenia TEXT NOT NULL, Zalaczniki BLOB NOT NULL, id_Klienta_ptk INTEGER NOT NULL, FOREIGN KEY (id_Klienta_ptk) REFERENCES Klienci(id_Klienta));

INSERT INTO Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia, Nazwa_Potwierdzenia, Zalaczniki, id_Klienta_ptk) VALUES (1, 'Skan Dowodu Tozsamosci', x'0500', 1);
INSERT INTO Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia, Nazwa_Potwierdzenia, Zalaczniki, id_Klienta_ptk) VALUES (2, 'Skan Paszportu', x'0500', 2);
INSERT INTO Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia, Nazwa_Potwierdzenia, Zalaczniki, id_Klienta_ptk) VALUES (3, 'Skan Prawa Jazdy', x'0500', 3);
INSERT INTO Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia, Nazwa_Potwierdzenia, Zalaczniki, id_Klienta_ptk) VALUES (4, 'Skan Prawa Jazdy', x'0500', 4);
INSERT INTO Potwierdzenie_Tozsamosci_Klienta(id_potwierdzenia, Nazwa_Potwierdzenia, Zalaczniki, id_Klienta_ptk) VALUES (5, 'Skan Dowodu Tozsamosci', x'0500', 5);

CREATE TABLE Wlasciciel_Pojazdu(id_Wlasciciela INTEGER NOT NULL PRIMARY KEY, Imie_Wlasciciela TEXT NOT NULL, Nazwisko_Wlasciciela TEXT NOT NULL, Adres_Kontaktowy TEXT NOT NULL, Telefon_Kontaktowy TEXT NOT NULL UNIQUE, Nazwa_Uzytkownika TEXT NOT NULL UNIQUE, Haslo TEXT NOT NULL UNIQUE, id_administracji_wp INTEGER NOT NULL, Status_Konta TEXT NOT NULL CHECK (Status_Konta IN ('Aktywne', 'Nieaktywne')), FOREIGN KEY (id_administracji_wp) REFERENCES Administracja(id_administracji));

INSERT INTO Wlasciciel_Pojazdu(id_Wlasciciela, Imie_Wlasciciela,Nazwisko_Wlasciciela, Adres_Kontaktowy, Telefon_Kontaktowy, Nazwa_Uzytkownika, Haslo, id_administracji_wp, Status_Konta) VALUES (1, 'T', 'M', 'T@gmail.pl', '19', 'X', '25', 1, 'Aktywne');
INSERT INTO Wlasciciel_Pojazdu(id_Wlasciciela, Imie_Wlasciciela,Nazwisko_Wlasciciela, Adres_Kontaktowy, Telefon_Kontaktowy, Nazwa_Uzytkownika, Haslo, id_administracji_wp, Status_Konta) VALUES (2, 'Wi', 'J', 'Wn@gmail.pl', '94321', '', 'AUIF1354DFBUSA', 3, 'Aktywne');
INSERT INTO Wlasciciel_Pojazdu(id_Wlasciciela, Imie_Wlasciciela,Nazwisko_Wlasciciela, Adres_Kontaktowy, Telefon_Kontaktowy, Nazwa_Uzytkownika, Haslo, id_administracji_wp, Status_Konta) VALUES (3, 'Ka', 'C', 'P@gmail.pl', '43534131', '', '1SDGUA', 2, 'Nieaktywne');



CREATE TABLE Potwierdzenie_Tozsamosci_Wlasciciela(id_potwierdzenia_wlasciciela INTEGER NOT NULL PRIMARY KEY, Nazwa_Potwierdzenia_Wlasciciela TEXT NOT NULL, Zalaczniki_Wlasciciel BLOB NOT NULL, id_Wlasciciela_ptw INTEGER NOT NULL, FOREIGN KEY (id_Wlasciciela_ptw) REFERENCES Wlasciciel_Pojazdu(id_Wlasciciela));

INSERT INTO Potwierdzenie_Tozsamosci_Wlasciciela(id_potwierdzenia_wlasciciela, Nazwa_Potwierdzenia_Wlasciciela, Zalaczniki_Wlasciciel, id_Wlasciciela_ptw) VALUES (1, 'Skan Dowodu Rejestacyjnego', x'0500', 1);
INSERT INTO Potwierdzenie_Tozsamosci_Wlasciciela(id_potwierdzenia_wlasciciela, Nazwa_Potwierdzenia_Wlasciciela, Zalaczniki_Wlasciciel, id_Wlasciciela_ptw) VALUES (2, 'Skan Dowodu Rejestacyjnego', x'0500', 2);
INSERT INTO Potwierdzenie_Tozsamosci_Wlasciciela(id_potwierdzenia_wlasciciela, Nazwa_Potwierdzenia_Wlasciciela, Zalaczniki_Wlasciciel, id_Wlasciciela_ptw) VALUES (3, 'Skan Dowodu Rejestacyjnego', x'0500', 3);



CREATE TABLE Samochody(id_Samochodu INTEGER NOT NULL PRIMARY KEY, Marka TEXT NOT NULL, Model TEXT NOT NULL, Kolor TEXT NOT NULL, Wlasciciel INTEGER NOT NULL, Status_Wynajmu TEXT NOT NULL CHECK (Status_Wynajmu IN ('Dostepny', 'Niedostepny')), FOREIGN KEY (Wlasciciel) REFERENCES Wlasciciel_Pojazdu(id_Wlasciciela));

INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (1, 'BMW', 'M3', 'Zielony', 3, 'Dostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (2, 'Nissan', 'GT-R', 'Czerwony', 1, 'Dostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (3, 'Ford', 'Mustang Shelby', 'Bordowy', 1, 'Niedostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (4, 'Tesla', 'Model 3', 'Bialy', 2, 'Niedostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (5, 'Cupra', 'Ateca', 'Czarny', 2, 'Niedostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (6, 'Koenigsegg', 'Gemera', 'Szary', 1, 'Niedostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (7, 'Bentley', 'Bentayga', 'Niebieski', 3, 'Dostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (8, 'Volkswagen', 'Scirocco', 'Bialy', 2, 'Niedostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (9, 'Mercedes-Benz', 'Klasa G AMG', 'Szary', 2, 'Dostepny');
INSERT INTO Samochody (id_Samochodu, Marka, Model, Kolor, Wlasciciel, Status_Wynajmu) VALUES (10, 'Wartburg', '311', 'Niebieski', 1, 'Dostepny');



CREATE TABLE Parametry_Pojazdu(id_parametru INTEGER NOT NULL PRIMARY KEY,id_pojazdu INTEGER NOT NULL, Rok_Produkcji INTEGER NOT NULL, Pojemnosc_silnika INTEGER NOT NULL, Numer_VIN TEXT NOT NULL UNIQUE, Rodzaj_Paliwa TEXT NOT NULL CHECK (Rodzaj_Paliwa IN ('Benzyna', 'Diesel', 'LPG', 'Elektryczny','Hybryda')), Moc INTEGER NOT NULL, Skrzynia_Biegow TEXT NOT NULL CHECK (Skrzynia_Biegow IN ('Manualna', 'Automatyczna')), Naped TEXT NOT NULL CHECK (Naped IN ('AWD', 'RWD','FWD')), FOREIGN KEY (id_pojazdu) REFERENCES Samochody(id_Samochodu));

INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (1, 1, 2017, 2979, 'WBS8M910705F95289', 'Benzyna', 450, 'Manualna', 'RWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (2, 2, 2018, 4100, 'JN1AR5EF5JM710173', 'Benzyna', 1500, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (3, 3, 2020, 5038, '12345678912345678', 'Benzyna', 460, 'Automatyczna', 'RWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (4, 4, 2019, 0, '5YJ3E1EA8KF444964', 'Elektryczny', 285, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (5, 5, 2021, 1984, 'VSSZZZ5FZM6548085', 'Benzyna', 300, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (6, 6, 2017, 2979, 'WBS15M96570734539', 'Hybryda', 1700, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (7, 7, 2018, 3996, 'SJAAE14V8JC021990', 'Diesel', 435, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (8, 8, 2010, 1390, 'WVWZZZ13ZAV435213', 'Diesel', 160, 'Manualna', 'FWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (9, 9, 2020, 3982, 'W1N4632761X520852', 'Benzyna', 585, 'Automatyczna', 'AWD');
INSERT INTO Parametry_Pojazdu(id_parametru, id_pojazdu, Rok_Produkcji, Pojemnosc_silnika, Numer_VIN, Rodzaj_Paliwa, Moc, Skrzynia_Biegow, Naped) VALUES (10, 10, 1960, 1111, '1DA6734GDAS874GDS', 'Benzyna', 1, 'Manualna', 'FWD');


CREATE TABLE Usterki(id_usterki INTEGER PRIMARY KEY, id_pojazdu_u INTEGER NOT NULL, Data_wystapienia DATE NOT NULL, Rodzaj TEXT NOT NULL, Data_Naprawy DATE NOT NULL, FOREIGN KEY (id_pojazdu_u) REFERENCES Samochody(id_Samochodu));

INSERT INTO Usterki(id_usterki, id_pojazdu_u, Data_wystapienia, Rodzaj, Data_Naprawy) VALUES (1, 5, '2021-03-25', 'Uszkodzony drazek kierowniczy', '2021-04-02');
INSERT INTO Usterki(id_usterki, id_pojazdu_u, Data_wystapienia, Rodzaj, Data_Naprawy) VALUES (2, 8, '2021-03-28', 'Tylni dyferencjał nie przetrwal spotkania z kraweznikiem', '2021-05-04');



CREATE TABLE Zdjecia_Pojazdu(id_zdjecia INTEGER NOT NULL PRIMARY KEY, Opis_Zdjecia TEXT NOT NULL, id_Samochodu_z INTEGER NOT NULL, Zdjecie BLOB NOT NULL, FOREIGN KEY (id_Samochodu_z) REFERENCES Samochody(id_Samochodu));

INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (1, 'Idealne przedstawienie tylnej lotki', 1, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (2, 'Najszybszy samochod w polsce', 2, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (3, 'Tor to jego prawdziwe srodowisko', 2, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (4, 'Najbardziej dopracowana kobra Shelbyego', 3, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (5, 'Piekny i elektryczny', 4, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (6, 'To wnetrze, nie jednego zachwyci', 4, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (7, 'Pierwszy sportowy Suv!', 5, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (8, 'Najszybsze seryjnie produkowane auto', 6, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (9, 'To wnetrze zachwyci nie jedna osobe swoja sportowa elegancja', 6, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (10, 'Tego samochodu nie da sie pomylic z zadnym innym', 6, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (11, 'Samochod dla tych ktorzy cenia luksus', 7, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (12, 'To wnetrze mowi samo za siebie', 7, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (13, 'Maly, ale nie jedna osobe potrafi zachwycic', 8, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (14, 'Czolg na kolach', 9, x'0500');
INSERT INTO Zdjecia_Pojazdu(id_zdjecia, Opis_Zdjecia, id_Samochodu_z, Zdjecie) VALUES (15, 'Klasyka', 10, x'0500');


CREATE TABLE Wynajem(id_Wynajmu INTEGER NOT NULL PRIMARY KEY, Data_Rozpoczecia DATE NOT NULL, Okres_Wynajmu INTEGER NOT NULL, Dzien_Zwrotu DATE NOT NULL, id_Klienta_w INTEGER NOT NULL, id_Samochodu_w INTEGER NOT NULL, id_Wlasciciela_w INTEGER NOT NULL, Status_Wynajmu TEXT NOT NULL CHECK (Status_Wynajmu IN ('Zakonczony', 'W trakcie')), FOREIGN KEY (id_Klienta_w) REFERENCES Klienci(id_Klienta), FOREIGN KEY (id_Samochodu_w) REFERENCES Samochody(id_Samochodu), FOREIGN KEY (id_Wlasciciela_w) REFERENCES Wlasciciel_Pojazdu(id_Wlasciciela));

INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (1, '2020-01-15', 15, '2020-01-30', 1, 3, 1, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (2, '2020-02-13', 3, '2020-02-16', 1, 5, 2, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (3, '2020-03-10', 11, '2020-03-21', 3, 5, 2, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (4, '2020-04-30', 15, '2020-05-14', 2, 9, 2, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (5, '2020-07-01', 63, '2020-09-01', 5, 6, 1, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (6, '2020-09-11', 1, '2020-09-12', 4, 2, 1, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (7, '2020-10-10', 32, '2020-11-11', 2, 8, 2, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (8, '2020-12-31', 31, '2021-01-30', 3, 1, 3, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (9, '2021-02-10', 6, '2021-02-16', 2, 3, 1, 'Zakonczony');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (10, '2021-03-01', 31, '2021-04-01', 5, 3, 1, 'W trakcie');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (11, '2021-03-26', 12, '2021-04-07', 3, 2, 1, 'W trakcie');
INSERT INTO Wynajem(id_Wynajmu, Data_Rozpoczecia, Okres_Wynajmu, Dzien_Zwrotu, id_Klienta_w, id_Samochodu_w, id_Wlasciciela_w, Status_Wynajmu) VALUES (12, '2021-03-30', 3, '2021-04-02', 2, 5, 2, 'W trakcie');


CREATE TABLE Rezerwacja (id_Rezerwacji INTEGER NOT NULL PRIMARY KEY, id_Klienta_r INTEGER NOT NULL, id_Samochodu_r INTEGER NOT NULL, Rozpoczecie_rezerwacji DATE NOT NULL, Dzien_Zwrotu DATE NOT NULL, Dzien_Rezerwacji DATE NOT NULL, Adres_email TEXT NOT NULL, FOREIGN KEY (id_Klienta_r) REFERENCES Klienci(id_Klienta), FOREIGN KEY (id_Samochodu_r) REFERENCES Samochody(id_Samochodu));

INSERT INTO Rezerwacja(id_Rezerwacji, id_Klienta_r, id_Samochodu_r, Rozpoczecie_rezerwacji, Dzien_Zwrotu, Dzien_Rezerwacji, Adres_email) VALUES (1, 1, 1, '2021-05-23', '2021-06-05', '2021-05-10','e@student.agh.edu.pl');
INSERT INTO Rezerwacja(id_Rezerwacji, id_Klienta_r, id_Samochodu_r, Rozpoczecie_rezerwacji, Dzien_Zwrotu, Dzien_Rezerwacji, Adres_email) VALUES (2, 3, 5, '2021-06-26', '2021-06-30', '2021-05-29','k@02.pl');
INSERT INTO Rezerwacja(id_Rezerwacji, id_Klienta_r, id_Samochodu_r, Rozpoczecie_rezerwacji, Dzien_Zwrotu, Dzien_Rezerwacji, Adres_email) VALUES (3, 2, 6, '2021-08-04', '2021-08-25', '2021-07-30','s@wp.pl');
INSERT INTO Rezerwacja(id_Rezerwacji, id_Klienta_r, id_Samochodu_r, Rozpoczecie_rezerwacji, Dzien_Zwrotu, Dzien_Rezerwacji, Adres_email) VALUES (4, 4, 8, '2021-08-06', '2021-08-31', '2021-05-12','n@gmail.com');
INSERT INTO Rezerwacja(id_Rezerwacji, id_Klienta_r, id_Samochodu_r, Rozpoczecie_rezerwacji, Dzien_Zwrotu, Dzien_Rezerwacji, Adres_email) VALUES (5, 5, 2, '2021-09-11', '2021-09-22', '2021-06-21','s@02.pl');

CREATE TABLE Platnosc(id_Platnosci INTEGER NOT NULL PRIMARY KEY, id_Wynajmu_p INTEGER NOT NULL, Kwota FLOAT NOT NULL, Oplaty_dodane FLOAT DEFAULT 0, Data_Platnosci DATE NOT NULL, Status_Platnosci TEXT NOT NULL CHECK (Status_Platnosci In ('Oplacone', 'Nieoplacone')), Sposob_Platnosci TEXT NOT NULL CHECK (Sposob_Platnosci IN ('Przelew', 'Gotowka', 'Karta')), id_administracji_p INTEGER NOT NULL, FOREIGN KEY (id_Wynajmu_p) REFERENCES Wynajem(id_Wynajmu), FOREIGN KEY (id_administracji_p) REFERENCES Administracja(id_administracji));

INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (1, 1, 5000, 200, '2020-01-15', 'Oplacone', 'Gotowka', 1);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (2, 2, 1000, 0, '2020-02-13', 'Oplacone', 'Przelew', 2);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (3, 3, 4500, 0, '2020-03-15', 'Oplacone', 'Przelew', 4);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (4, 4, 5000, 0, '2020-04-30', 'Oplacone', 'Karta', 5);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (5, 5, 10000, 2000, '2020-09-01', 'Oplacone', 'Gotowka', 3);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (6, 6, 200, 0, '2020-09-11', 'Oplacone', 'Gotowka', 1);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (7, 7, 5000, 230, '2020-10-15', 'Oplacone', 'Przelew', 2);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (8, 8, 4900, 0, '2020-12-15', 'Oplacone', 'Gotowka', 5);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (9, 9, 1000, 300, '2021-02-11', 'Oplacone', 'Karta', 4);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (10, 10, 4000, 3200, '2021-04-01', 'Nieoplacone', 'Przelew', 1);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (11, 11, 2000, 0, '2021-04-01', 'Nieoplacone', 'Gotowka', 3);
INSERT INTO Platnosc(id_Platnosci, id_Wynajmu_p, Kwota, Oplaty_dodane, Data_Platnosci, Status_Platnosci, Sposob_Platnosci, id_administracji_p) VALUES (12, 12, 750, 0, '2021-04-02', 'Nieoplacone', 'Przelew', 2);

CREATE TABLE Recenzje(id_recenzji INTEGER PRIMARY KEY, Recenzja TEXT NOT NULL, Ocena INTEGER(1) NOT NULL, Data_Opublikowania Date NOT NULL, id_klienta_re INTEGER NOT NULL, id_Samochodu_re INTEGER NOT NULL, FOREIGN KEY (id_klienta_re) REFERENCES Klienci(id_Klienta), FOREIGN KEY (id_Samochodu_re) REFERENCES Samochody(id_Samochodu));

INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (1, 'Idealny wybor na Tor',1 , '2020-01-26', 1, 1);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (2, 'Samochod dodaje adrenaliny, niestety nie nadaje sie do miasta', 0, '2020-02-12', 2, 2);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (3, 'Pozytywne wrazenia z jazdy, jednak trzeba uwazac w zakretach', 1,  '2020-03-23', 3, 3);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (4, 'Cisza i spokoj', 1, '2020-03-30', 4, 4);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (5, 'Idealny do miasta, sprawdzil sie te kilka dni', 1, '2020-05-12', 5, 5);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (6, 'Moje marzenie na reszcie sie spelnilo', 1, '2020-07-31', 3, 6);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (7, 'Kazdy na ulicy zwroci na ciebie uwage', 0, '2020-09-21', 5, 7);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (8, 'Idealne auto na codzien, kiedy budzet nas ogranicza',1 , '2020-11-22',1, 8);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (9, 'Czolg na kolach', 0, '2020-12-10', 4, 9);
INSERT INTO Recenzje(id_Recenzji, Recenzja, Ocena, Data_Opublikowania, id_Klienta_re, id_Samochodu_re) VALUES (10, 'Piekna klasyka', 1, '2021-04-05', 2, 10);


COMMIT;
