<?php

namespace App\Entity;

use App\Repository\MangaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MangaRepository::class)
 */
class Manga
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $NbPage;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=2)
     */
    private $PrixManga;

    /**
     * @ORM\Column(type="string", length=99999, nullable=true)
     */
    private $DescManga;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $CheminImage;

    /**
     *
     * @ORM\ManyToOne(targetEntity=Serie::class, inversedBy="Serie_Manga")
     */
    private $serie;

    /**
     * @ORM\ManyToOne(targetEntity=Auteur::class, inversedBy="Auteur_Manga")
     * @ORM\JoinColumn(nullable=false)
     */
    private $auteur;

    public function getSerie(): ?Serie
    {
        return $this->serie;
    }

    public function setSerie(?Serie $serie): self
    {
        $this->serie = $serie;

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNbPage(): ?int
    {
        return $this->NbPage;
    }

    public function setNbPage(int $NbPage): self
    {
        $this->NbPage = $NbPage;

        return $this;
    }

    public function getPrixManga(): ?int
    {
        return $this->PrixManga;
    }

    public function setPrixManga(int $PrixManga): self
    {
        $this->PrixManga = $PrixManga;

        return $this;
    }

    public function getDescManga(): ?string
    {
        return $this->DescManga;
    }

    public function setDescManga(?string $DescManga): self
    {
        $this->DescManga = $DescManga;

        return $this;
    }

    public function getCheminImage(): ?string
    {
        return $this->CheminImage;
    }

    public function setCheminImage(string $CheminImage): self
    {
        $this->CheminImage = $CheminImage;

        return $this;
    }

    public function getAuteur(): ?Auteur
    {
        return $this->auteur;
    }

    public function setAuteur(?Auteur $auteur): self
    {
        $this->auteur = $auteur;

        return $this;
    }











}
