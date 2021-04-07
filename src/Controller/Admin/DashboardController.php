<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\UserMenu;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;


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
        ->setTitle('Porte Folio Administateur')->setFaviconPath("Images/MtLogo.png");
    }

    public function configureUserMenu(UserInterface $user): UserMenu
    {
        return UserMenu::new()
            ->setName($user->getUsername())

            ->displayUserAvatar(false)
            ->addMenuItems([
                MenuItem::linkToRoute('Mon Profil', 'fa fa-id-card', 'admin'),
                MenuItem::linkToRoute('Page d\'acceuil', 'fa fa-home','home'),
                MenuItem::section(),
                MenuItem::linkToLogout('Déconnexion', 'fa fa-sign-out'),
            ]);
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
        yield MenuItem::linkToCrud('Commentaire','fa fa-book',CommentairesCrudController::getEntityFqcn());

    }
}