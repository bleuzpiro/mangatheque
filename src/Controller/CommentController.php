<?php

namespace App\Controller;

use App\Entity\Commentaires;
use App\Form\CommentaireType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CommentController extends AbstractController
{
    /**
     * @Route("/Commentaires", name="Commentaires")
     */
    public function index(int $serie,Request $request): Response
    {
//        $task = new Commentaires();
//
//        $form = $this->createForm(CommentaireType::class, $task);
//
//        $form->handleRequest($request);
//        if ($form->isSubmitted() && $form->isValid()) {
//            // $form->getData() holds the submitted values
//            // but, the original `$task` variable has also been updated
//            $task = $form->getData();
//
//             $entityManager = $this->getDoctrine()->getManager();
//             $entityManager->persist($task);
//             $entityManager->flush();
//
//            return $this->redirectToRoute('task_success');
//        }

    }
}
