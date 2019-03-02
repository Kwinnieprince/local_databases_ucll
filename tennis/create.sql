create schema tennis

create table spelers_xxl
(
  spelersnr   integer  not null
    constraint pk_key_spelers_xxl
      primary key,
  naam        char(15) not null,
  voorletters char(3)  not null,
  geb_datum   date,
  geb_uur     time,
  geslacht    char     not null,
  jaartoe     smallint not null,
  straat      text     not null,
  huisnr      char(4),
  postcode    char(6),
  plaats      text     not null,
  telefoon    char(10),
  bondsnr     char(10)
);

alter table spelers_xxl
  owner to postgres;

create table spelers
(
  spelersnr   integer     not null
    constraint spelers_pkey
      primary key,
  naam        char(15)    not null,
  voorletters char(3)     not null,
  geb_datum   date,
  geslacht    char        not null
    constraint spelers_geslacht_check
      check (geslacht = ANY (ARRAY ['V'::bpchar, 'M'::bpchar])),
  jaartoe     smallint    not null
    constraint spelers_jaartoe_check
      check (jaartoe > 1969),
  straat      varchar(30) not null,
  huisnr      char(4),
  postcode    char(6)
    constraint spelers_postcode_check
      check (postcode ~~ '______'::text),
  plaats      varchar(30) not null,
  telefoon    char(13),
  bondsnr     char(4)
);

alter table spelers
  owner to postgres;

create table bestuursleden
(
  spelersnr   integer not null
    constraint bestuursleden_spelersnr_fkey
      references spelers,
  begin_datum date    not null
    constraint bestuursleden_begin_datum_check
      check (begin_datum >= '1990-01-01'::date),
  eind_datum  date,
  functie     char(20),
  constraint bestuursleden_pkey
    primary key (spelersnr, begin_datum),
  constraint bestuursleden_check
    check (begin_datum < eind_datum)
);

alter table bestuursleden
  owner to postgres;

create table boetes
(
  betalingsnr integer       not null
    constraint boetes_pkey
      primary key,
  spelersnr   integer       not null
    constraint boetes_spelersnr_fkey
      references spelers,
  datum       date          not null
    constraint boetes_datum_check
      check (datum >= '1969-12-31'::date),
  bedrag      numeric(7, 2) not null
    constraint boetes_bedrag_check
      check (bedrag > (0)::numeric)
);

alter table boetes
  owner to postgres;

create table teams
(
  teamnr    integer not null
    constraint teams_pkey
      primary key,
  spelersnr integer not null
    constraint teams_spelersnr_fkey
      references spelers,
  divisie   char(6) not null
    constraint teams_divisie_check
      check (divisie = ANY (ARRAY ['ere'::bpchar, 'tweede'::bpchar]))
);

alter table teams
  owner to postgres;

create table wedstrijden
(
  wedstrijdnr integer  not null
    constraint wedstrijden_pkey
      primary key,
  teamnr      integer  not null
    constraint wedstrijden_teamnr_fkey
      references teams,
  spelersnr   integer  not null
    constraint wedstrijden_spelersnr_fkey
      references spelers,
  gewonnen    smallint not null
    constraint wedstrijden_gewonnen_check
      check ((gewonnen >= 0) AND (gewonnen <= 3)),
  verloren    smallint not null
    constraint wedstrijden_verloren_check
      check ((verloren >= 0) AND (verloren <= 3))
);

alter table wedstrijden
  owner to postgres;

create table spelers_l
(
  spelersnr   integer  not null
    constraint pk_key_spelers_l
      primary key,
  naam        char(15) not null,
  voorletters char(3)  not null,
  geb_datum   date,
  geb_uur     time,
  geslacht    char     not null,
  jaartoe     smallint not null,
  straat      text     not null,
  huisnr      char(4),
  postcode    char(6),
  plaats      text     not null,
  telefoon    char(10),
  bondsnr     char(10)
);

alter table spelers_l
  owner to postgres;

create table spelers_xl
(
  spelersnr   integer  not null
    constraint pk_key_spelers_xl
      primary key,
  naam        char(15) not null,
  voorletters char(3)  not null,
  geb_datum   date,
  geb_uur     time,
  geslacht    char     not null,
  jaartoe     smallint not null,
  straat      text     not null,
  huisnr      char(4),
  postcode    char(6),
  plaats      text     not null,
  telefoon    char(10),
  bondsnr     char(10)
);

alter table spelers_xl
  owner to postgres;

create table spelers_xxxl
(
  spelersnr   integer  not null
    constraint pk_key_spelers_xxxl
      primary key,
  naam        char(15) not null,
  voorletters char(3)  not null,
  geb_datum   date,
  geb_uur     time,
  geslacht    char     not null,
  jaartoe     smallint not null,
  straat      text     not null,
  huisnr      char(4),
  postcode    char(6),
  plaats      text     not null,
  telefoon    char(10),
  bondsnr     char(10)
);

alter table spelers_xxxl
  owner to postgres;
