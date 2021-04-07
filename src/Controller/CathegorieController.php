<?php

namespace App\Controller;

use App\Entity\Cathegorie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CathegorieController extends AbstractController
{
    /**
     * @Route("/categorie", name="categorie")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Cathegorie::class);


        $user =  $repository->findAll();
        return $this->render('cathegorie/index.html.twig', [
            'categories' => $user,
        ]);
    }
}
