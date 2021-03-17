<?php

namespace App\Controller;

use Proxies\__CG__\App\Entity\Serie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SerieController extends AbstractController
{
    /**
     * @Route("/serie", name="serie")
     */
    public function index(): Response
    {

        $repository = $this->getDoctrine()->getRepository(Serie::class);
        $series =  $repository->findAll();

        return $this->render('serie/index.html.twig', [
            'series' => $series,
        ]);
    }
}
