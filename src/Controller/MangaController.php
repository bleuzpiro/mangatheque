<?php

namespace App\Controller;

use App\Entity\Admin;
use App\Entity\Commentaires;
use App\Entity\Manga;
use App\Form\InscriptionFormType;
use Proxies\__CG__\App\Entity\Serie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MangaController extends AbstractController
{
    /**
     * @Route("/manga-{serie}", name="manga")
     * @param int $serie
     * @param Request $request
     * @return Response
     */
    public function index(int $serie,Request $request): Response
    {
        $mangas = $this->getDoctrine()->getRepository(Manga::class);
        $mangas = $mangas->findBy(["serie" => $serie]);

        $commentaires = $this->getDoctrine()->getRepository(Commentaires::class);
        $commentaires = $commentaires->findAll();




        return $this->render('manga/index.html.twig', [
            'mangas' => $mangas, 'serieId' => $serie, 'commentaires' => $commentaires
        ]);
    }

}
