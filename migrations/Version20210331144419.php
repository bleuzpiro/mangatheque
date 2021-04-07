<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210331144419 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE commentaires DROP FOREIGN KEY FK_D9BEC0C4141D5FC4');
        $this->addSql('DROP INDEX IDX_D9BEC0C4141D5FC4 ON commentaires');
        $this->addSql('ALTER TABLE commentaires CHANGE commanteaire_manga_id manga_id INT NOT NULL');
        $this->addSql('ALTER TABLE commentaires ADD CONSTRAINT FK_D9BEC0C47B6461 FOREIGN KEY (manga_id) REFERENCES manga (id)');
        $this->addSql('CREATE INDEX IDX_D9BEC0C47B6461 ON commentaires (manga_id)');
        $this->addSql('ALTER TABLE manga CHANGE desc_manga desc_manga MEDIUMTEXT DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE commentaires DROP FOREIGN KEY FK_D9BEC0C47B6461');
        $this->addSql('DROP INDEX IDX_D9BEC0C47B6461 ON commentaires');
        $this->addSql('ALTER TABLE commentaires CHANGE manga_id commanteaire_manga_id INT NOT NULL');
        $this->addSql('ALTER TABLE commentaires ADD CONSTRAINT FK_D9BEC0C4141D5FC4 FOREIGN KEY (commanteaire_manga_id) REFERENCES manga (id)');
        $this->addSql('CREATE INDEX IDX_D9BEC0C4141D5FC4 ON commentaires (commanteaire_manga_id)');
        $this->addSql('ALTER TABLE manga CHANGE desc_manga desc_manga MEDIUMTEXT CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}
