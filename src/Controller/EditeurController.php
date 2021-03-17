<?php

namespace App\Controller;

use App\Entity\Editeur;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditeurController extends AbstractController
{
    /**
     * @Route("/editeur", name="editeur")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(editeur::class);
        $editeur =  $repository->findAll();
        return $this->render('editeur/index.html.twig', [
            'editeurs' => $editeur,
        ]);
    }
}
