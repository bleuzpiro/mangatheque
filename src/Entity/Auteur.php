<?php

namespace App\Entity;

use App\Repository\AuteurRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=AuteurRepository::class)
 */
class Auteur
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
     * @ORM\OneToMany(targetEntity=Manga::class, mappedBy="auteur")
     */
    private $Auteur_Manga;

    public function __construct()
    {
        $this->Auteur_Manga = new ArrayCollection();
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

    /**
     * @return Collection|manga[]
     */
    public function getAuteurManga(): Collection
    {
        return $this->Auteur_Manga;
    }

    public function addAuteurManga(manga $auteurManga): self
    {
        if (!$this->Auteur_Manga->contains($auteurManga)) {
            $this->Auteur_Manga[] = $auteurManga;
            $auteurManga->setAuteur($this);
        }

        return $this;
    }

    public function removeAuteurManga(manga $auteurManga): self
    {
        if ($this->Auteur_Manga->removeElement($auteurManga)) {
            // set the owning side to null (unless already changed)
            if ($auteurManga->getAuteur() === $this) {
                $auteurManga->setAuteur(null);
            }
        }

        return $this;
    }
}
