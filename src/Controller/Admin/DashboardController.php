<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        $routeBuilder = $this->get(AdminUrlGenerator::class);

        return $this->redirect($routeBuilder->setController(AdminCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
        ->setTitle('Porte Folio Administateur');
    }


    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Menu', 'fa fa-home');
        yield MenuItem::linkToCrud('Utillisateur','fa fa-user-circle',AdminCrudController::getEntityFqcn());
        yield MenuItem::linkToCrud('Categorie','fa fa-th-large',CathegorieCrudController::getEntityFqcn());
        yield MenuItem::linkToCrud('Editeur','fa fa-pen',EditeurCrudController::getEntityFqcn());
        yield MenuItem::linkToCrud('Serie','fa fa-list-ol',SerieCrudController::getEntityFqcn());
        yield MenuItem::linkToCrud('Manga','fa fa-book',MangaCrudController::getEntityFqcn());
        yield MenuItem::linkToCrud('Auteur','fa fa-book',AuteurCrudController::getEntityFqcn());


    }
}