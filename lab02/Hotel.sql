DROP TABLE IF EXISTS pokoje CASCADE;
DROP TABLE IF EXISTS goscie CASCADE;

CREATE TABLE goscie (
    id              SERIAL PRIMARY KEY,
    imie            VARCHAR(50) NOT NULL,
    nazwisko        VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE,
    telefon         VARCHAR(15),
    data_rejestracji DATE DEFAULT CURRENT_DATE
);

CREATE TABLE pokoje (
    id              SERIAL PRIMARY KEY,
    numer_pokoju    INTEGER NOT NULL UNIQUE,
    typ_pokoju      VARCHAR(30) NOT NULL,
    cena_za_noc     NUMERIC(6,2) NOT NULL,
    czy_zajety      BOOLEAN DEFAULT FALSE,
    gosc_id         INTEGER REFERENCES goscie(id) ON DELETE SET NULL,
    ostatni_serwis  DATE
);

INSERT INTO goscie (imie, nazwisko, email, telefon, data_rejestracji) VALUES
    ('Jan', 'Kowalski', 'j.kowal@wp.pl', '123456789', '2026-01-10'),
    ('Anna', 'Nowak', 'aniak@o2.pl', '987654321', '2026-02-15'),
    ('Piotr', 'Wiśniewski', 'p.wisnia@gmail.com', '555666777', '2026-03-01'),
    ('Maria', 'Wójcik', 'mwojcik@wp.pl', '444333222', '2026-03-12'),
    ('Krzysztof', 'Kowalczyk', 'kkowal@onet.pl', '111222333', '2026-04-05'),
    ('Elena', 'Zielińska', 'elena.z@o2.pl', '666777888', '2026-05-20'),
    ('Tomasz', 'Szymański', 'tomek.s@wp.pl', '999888777', '2026-06-02'),
    ('Barbara', 'Woźniak', 'basia.w@gmail.com', '222444666', '2026-07-14'),
    ('Marcin', 'Kozłowski', 'm.koziol@o2.pl', '333555777', '2026-08-22'),
    ('Magdalena', 'Jankowska', 'mjank@wp.pl', '777888999', '2026-09-05');

INSERT INTO pokoje (numer_pokoju, typ_pokoju, cena_za_noc, czy_zajety, gosc_id, ostatni_serwis) VALUES
    (101, 'Jednoosobowy Standard', 150.00, TRUE, 1, '2026-10-15'),
    (102, 'Jednoosobowy Standard', 150.00, FALSE, NULL, '2026-10-16'),
    (103, 'Dwuosobowy Standard', 220.50, TRUE, 2, '2026-10-14'),
    (104, 'Dwuosobowy Standard', 220.50, FALSE, NULL, '2026-10-18'),
    (201, 'Dwuosobowy Komfort', 280.00, TRUE, 3, '2026-10-12'),
    (202, 'Dwuosobowy Komfort', 280.00, TRUE, 4, '2026-10-13'),
    (203, 'Apartament typu Suite', 450.00, TRUE, 5, '2026-10-17'),
    (204, 'Apartament typu Suite', 450.00, FALSE, NULL, '2026-10-19'),
    (301, 'Prezydencki VIP', 990.99, TRUE, 6, '2026-10-10'),
    (302, 'Rodzinny Family', 350.00, FALSE, NULL, '2026-10-15');

SELECT * FROM goscie;
SELECT * FROM pokoje;
