<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210317122213 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE admin (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_880E0D76F85E0677 (username), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE auteur (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE cathegorie (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE editeur (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE manga (id INT AUTO_INCREMENT NOT NULL, serie_id INT DEFAULT NULL, auteur_id INT NOT NULL, nb_page INT NOT NULL, prix_manga INT NOT NULL, desc_manga MEDIUMTEXT DEFAULT NULL, chemin_image VARCHAR(255) DEFAULT NULL, INDEX IDX_765A9E03D94388BD (serie_id), INDEX IDX_765A9E0360BB6FE6 (auteur_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE serie (id INT AUTO_INCREMENT NOT NULL, serie_editeur_id INT DEFAULT NULL, serie_cathegorie_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, etat TINYINT(1) NOT NULL, nombres_de_tomes INT NOT NULL, INDEX IDX_AA3A93346283F725 (serie_editeur_id), INDEX IDX_AA3A93342C241E0B (serie_cathegorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE manga ADD CONSTRAINT FK_765A9E03D94388BD FOREIGN KEY (serie_id) REFERENCES serie (id)');
        $this->addSql('ALTER TABLE manga ADD CONSTRAINT FK_765A9E0360BB6FE6 FOREIGN KEY (auteur_id) REFERENCES auteur (id)');
        $this->addSql('ALTER TABLE serie ADD CONSTRAINT FK_AA3A93346283F725 FOREIGN KEY (serie_editeur_id) REFERENCES editeur (id)');
        $this->addSql('ALTER TABLE serie ADD CONSTRAINT FK_AA3A93342C241E0B FOREIGN KEY (serie_cathegorie_id) REFERENCES cathegorie (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE manga DROP FOREIGN KEY FK_765A9E0360BB6FE6');
        $this->addSql('ALTER TABLE serie DROP FOREIGN KEY FK_AA3A93342C241E0B');
        $this->addSql('ALTER TABLE serie DROP FOREIGN KEY FK_AA3A93346283F725');
        $this->addSql('ALTER TABLE manga DROP FOREIGN KEY FK_765A9E03D94388BD');
        $this->addSql('DROP TABLE admin');
        $this->addSql('DROP TABLE auteur');
        $this->addSql('DROP TABLE cathegorie');
        $this->addSql('DROP TABLE editeur');
        $this->addSql('DROP TABLE manga');
        $this->addSql('DROP TABLE serie');
    }
}
