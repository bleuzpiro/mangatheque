<?php

namespace App\Controller;

use App\Entity\Manga;
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
        $repository = $this->getDoctrine()->getRepository(Manga::class);

        $mangas =  $repository->findOneBy(array('id' => $serie));

        return $this->render('manga/index.html.twig', [
            'manga' => $mangas,
        ]);
    }

}
