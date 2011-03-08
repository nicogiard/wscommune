ALTER TABLE "departement" DROP CONSTRAINT fk_departement_region;
ALTER TABLE "arrondissement" DROP CONSTRAINT fk_arrondissement_region;
ALTER TABLE "arrondissement" DROP CONSTRAINT fk_arrondissement_departement;
ALTER TABLE "canton" DROP CONSTRAINT fk_canton_region;
ALTER TABLE "canton" DROP CONSTRAINT fk_canton_departement;
ALTER TABLE "canton" DROP CONSTRAINT fk_canton_arrondissement;
ALTER TABLE "commune" DROP CONSTRAINT fk_commune_region;
ALTER TABLE "commune" DROP CONSTRAINT fk_commune_departement;
ALTER TABLE "commune" DROP CONSTRAINT fk_commune_arrondissement;

DROP TABLE "region";
DROP TABLE "departement";
DROP TABLE "arrondissement";
DROP TABLE "canton";
DROP TABLE "commune";
