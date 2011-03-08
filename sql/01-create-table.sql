CREATE TABLE "region"
(
  code character varying NOT NULL,
  "typenomclair" integer NOT NULL,
  libelle character varying NOT NULL,
  "libelleenrichi" character varying NOT NULL,
  "codecheflieu" character varying,
  CONSTRAINT pk_region PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE "departement"
(
  code character varying NOT NULL,
  region_code character varying NOT NULL,
  "typenomclair" integer NOT NULL,
  libelle character varying NOT NULL,
  "libelleenrichi" character varying NOT NULL,
  "codecheflieu" character varying,
  CONSTRAINT pk_departement PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);

CREATE TABLE "arrondissement"
(
  code character varying NOT NULL,
  region_code character varying NOT NULL,
  departement_code character varying NOT NULL,
  "typenomclair" integer NOT NULL,
  libelle character varying NOT NULL,
  article character varying NOT NULL,
  "libelleenrichi" character varying NOT NULL,
  "articleenrichi" character varying NOT NULL,
  "codecheflieu" character varying,
  CONSTRAINT pk_arrondissement PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);


CREATE TABLE "canton"
(
  code character varying NOT NULL,
  region_code character varying NOT NULL,
  departement_code character varying NOT NULL,
  arrondissement_code character varying NOT NULL,
  "typecanton" integer NOT NULL,
  "typenomclair" integer NOT NULL,
  libelle character varying NOT NULL,
  article character varying NOT NULL,
  "libelleenrichi" character varying NOT NULL,
  "articleenrichi" character varying NOT NULL,
  "codecheflieu" character varying,
  CONSTRAINT pk_canton PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);


CREATE TABLE "commune"
(
  code character varying NOT NULL,
  region_code character varying NOT NULL,
  departement_code character varying NOT NULL,
  arrondissement_code character varying NOT NULL,
  canton_code character varying NOT NULL,
  codeinsee character varying NOT NULL,
  codepostal character varying NOT NULL,
  "decoupagecommune" integer NOT NULL,
  "typecheflieu" integer NOT NULL,
  "typenomclair" integer NOT NULL,
  libelle character varying NOT NULL,
  article character varying NOT NULL,
  "libelleenrichi" character varying NOT NULL,
  "articleenrichi" character varying NOT NULL,
  CONSTRAINT pk_commune PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE,
  autovacuum_enabled=true
);


ALTER TABLE "departement"
  ADD CONSTRAINT fk_departement_region FOREIGN KEY (region_code)
      REFERENCES "region" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "arrondissement"
  ADD CONSTRAINT fk_arrondissement_region FOREIGN KEY (region_code)
      REFERENCES "region" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "arrondissement"
  ADD CONSTRAINT fk_arrondissement_departement FOREIGN KEY (departement_code)
      REFERENCES "departement" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "canton"
  ADD CONSTRAINT fk_canton_region FOREIGN KEY (region_code)
      REFERENCES "region" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "canton"
  ADD CONSTRAINT fk_canton_departement FOREIGN KEY (departement_code)
      REFERENCES "departement" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "canton"
  ADD CONSTRAINT fk_canton_arrondissement FOREIGN KEY (arrondissement_code)
      REFERENCES "arrondissement" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "commune"
  ADD CONSTRAINT fk_commune_region FOREIGN KEY (region_code)
      REFERENCES "region" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "commune"
  ADD CONSTRAINT fk_commune_departement FOREIGN KEY (departement_code)
      REFERENCES "departement" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "commune"
  ADD CONSTRAINT fk_commune_arrondissement FOREIGN KEY (arrondissement_code)
      REFERENCES "arrondissement" (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE "region" OWNER TO wsinsee;
ALTER TABLE "departement" OWNER TO wsinsee;
ALTER TABLE "arrondissement" OWNER TO wsinsee;
ALTER TABLE "canton" OWNER TO wsinsee;
ALTER TABLE "commune" OWNER TO wsinsee;
