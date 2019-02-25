create schema ruimtereizen;
CREATE TABLE bezoeken (
    reisnr numeric(4,0) NOT NULL,
    objectnaam varchar(10) NOT NULL,
    volgnr numeric(2,0) NOT NULL,
    verblijfsduur numeric(4,0) NOT NULL
);
CREATE TABLE deelnames (
    reisnr numeric(4,0) NOT NULL,
    klantnr numeric(4,0) NOT NULL
);
CREATE TABLE hemelobjecten (
    objectnaam varchar(10) NOT NULL,
    satellietvan varchar(10),
    afstand numeric(10,3),
    diameter numeric(7,0)
);
CREATE TABLE klanten (
    klantnr numeric(4,0) NOT NULL,
    naam varchar(20) NOT NULL,
    vnaam varchar(15) NOT NULL,
    geboortedatum date NOT NULL
);
CREATE TABLE reizen (
    reisnr numeric(4,0) NOT NULL,
    vertrekdatum date NOT NULL,
    reisduur numeric(4,0) NOT NULL,
    prijs numeric(5,2)
);
ALTER TABLE bezoeken
    ADD CONSTRAINT bezoeken_pkey PRIMARY KEY (reisnr, volgnr);
ALTER TABLE deelnames
    ADD CONSTRAINT deelnames_pkey PRIMARY KEY (reisnr, klantnr);
ALTER TABLE hemelobjecten
    ADD CONSTRAINT hemelobjecten_pkey PRIMARY KEY (objectnaam);
ALTER TABLE klanten
    ADD CONSTRAINT klanten_pkey PRIMARY KEY (klantnr);
ALTER TABLE reizen
    ADD CONSTRAINT reizen_pkey PRIMARY KEY (reisnr);
