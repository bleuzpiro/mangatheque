<?php

namespace App\Controller;

use App\Entity\Manga;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MangaController extends AbstractController
{
    /**
     * @Route("/manga", name="manga")
     */
    public function index(): Response
    {

        $repository = $this->getDoctrine()->getRepository(Manga::class);
        $mangas =  $repository->findAll();

        return $this->render('manga/index.html.twig', [
            'mangas' => $mangas,
        ]);
    }
}
