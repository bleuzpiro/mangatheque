<?php

namespace App\Entity;

use App\Repository\SerieRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=SerieRepository::class)
 */
class Serie
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Nom;

    /**
     * @ORM\Column(type="boolean")
     */
    private $Etat;

    /**
     * @ORM\ManyToOne(targetEntity=Editeur::class, inversedBy="series")
     */
    private $Serie_Editeur;

    /**
     * @ORM\OneToMany(targetEntity=Manga::class, mappedBy="serie")
     */
    private $Serie_Manga;

    /**
     * @ORM\ManyToOne(targetEntity=Cathegorie::class, inversedBy="series")
     */
    private $Serie_Cathegorie;

    /**
     * @ORM\Column(type="integer")
     */
    private $nombresDeTomes;

    public function __construct()
    {
        $this->Serie_Manga = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->Nom;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->Nom;
    }

    public function setNom(string $Nom): self
    {
        $this->Nom = $Nom;

        return $this;
    }

    public function getEtat(): ?bool
    {
        return $this->Etat;
    }

    public function setEtat(bool $Etat): self
    {
        $this->Etat = $Etat;

        return $this;
    }

    public function getSerieEditeur(): ?Editeur
    {
        return $this->Serie_Editeur;
    }

    public function setSerieEditeur(?Editeur $Serie_Editeur): self
    {
        $this->Serie_Editeur = $Serie_Editeur;

        return $this;
    }

    /**
     * @return Collection|Manga[]
     */
    public function getSerieManga(): Collection
    {
        return $this->Serie_Manga;
    }


    public function addSerieManga(Manga $serieManga): self
    {
        if (!$this->Serie_Manga->contains($serieManga)) {
            $this->Serie_Manga[] = $serieManga;
            $serieManga->setSerie($this);
        }

        return $this;
    }

    public function removeSerieManga(Manga $serieManga): self
    {
        if ($this->Serie_Manga->removeElement($serieManga)) {
            // set the owning side to null (unless already changed)
            if ($serieManga->getSerie() === $this) {
                $serieManga->setSerie(null);
            }
        }

        return $this;
    }

    public function getSerieCathegorie(): ?Cathegorie
    {
        return $this->Serie_Cathegorie;
    }

    public function setSerieCathegorie(?Cathegorie $Serie_Cathegorie): self
    {
        $this->Serie_Cathegorie = $Serie_Cathegorie;

        return $this;
    }

    public function getNombresDeTomes(): ?int
    {
        return $this->nombresDeTomes;
    }

    public function setNombresDeTomes(int $nombresDeTomes): self
    {
        $this->nombresDeTomes = $nombresDeTomes;

        return $this;
    }


}
