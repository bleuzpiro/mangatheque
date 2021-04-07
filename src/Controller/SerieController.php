<?php

namespace App\Controller;

use App\Entity\Manga;
use Proxies\__CG__\App\Entity\Serie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SerieController extends AbstractController
{
    /**
     * @Route("/serie", name="serie")
     * @Route("/serie-{editeur}", name="serie")
     */
    public function index(int $editeur=0): Response
    {

        $series = $this->getDoctrine()->getRepository(Serie::class);

        $mangas = $this->getDoctrine()->getRepository(Manga::class);

        if ($editeur == 0) {
            $series = $series->findAll();
        }
        else{
            $series = $series->findBy(["Serie_Editeur" => $editeur]);
        }


        $imageManga = [];
        foreach ($series as $serie ){
            $data = $mangas->findOneBy(array('serie'=> $serie));
            if (empty($data)){
                $imageManga[] = "";
            }
            else{
                $imageManga[] = $data->getCheminImage();
            }
        }

        return $this->render('serie/index.html.twig', [
            'series' => $series,'mangaImage' => $imageManga,
        ]);
    }
}
