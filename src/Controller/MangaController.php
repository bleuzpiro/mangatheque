<?php

namespace App\Controller;

use App\Entity\Admin;
use App\Entity\Commentaires;
use App\Entity\Manga;
use App\Form\CommentaireType;
use App\Form\InscriptionFormType;
use Proxies\__CG__\App\Entity\Serie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MangaController extends AbstractController
{
    /**
     * @Route("/manga", name="manga")
     * @Route("/manga-{serie}", name="manga")
     * @param int $serie
     * @param Request $request
     * @return Response
     */
    public function index(int $serie,Request $request): Response
    {
        if (!empty($serie))
        {
            $serie = 1;
        }
		$commentaires = $this->getDoctrine()->getRepository(Commentaires::class);
        $commentaires = $commentaires->findAll();


        $mangas = $this->getDoctrine()->getRepository(Manga::class);
        $mangas = $mangas->findBy(["serie" => $serie]);


        return $this->render('manga/index.html.twig', [
            'mangas' => $mangas, 'serieId' => $serie, 'commentaires' => $commentaires,
        ]);
    }

    /**
     * @Route("/ajaxManga-{mangaid}", name="ajaxManga")
     * @param Request $request
     * @return JsonResponse|Response
     */
    public function AJAX(int $mangaid,Request $request){

        if($mangaid){
            $comm = new Commentaires();

            $form = $this->createForm(CommentaireType::class, $comm);

            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
                $task = $form->getData();

                 $entityManager = $this->getDoctrine()->getManager();
                 $entityManager->persist($task);
                 $entityManager->flush();

                return $this->redirectToRoute('manga-'.$mangaid);
            }
            return $this->render('test/index.html.twig', ["test"=>"OUI",'form' => $form->createView(),]);
        }
        return $this->render('test/index.html.twig', ["test"=>"NON"]);
    }

}
