<?php

namespace App\Controller;

use App\Entity\Manga;
use Proxies\__CG__\App\Entity\Serie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MangaController extends AbstractController
{
    /**
     * @Route("/manga-{serie}", name="manga")
     */
    public function index(int $serie): Response
    {
        $mangas = $this->getDoctrine()->getRepository(Manga::class);
        $mangas = $mangas->findBy(["serie" => $serie]);

        return $this->render('manga/index.html.twig', [
            'mangas' => $mangas, 'serieId' => $serie,
        ]);
    }

}
