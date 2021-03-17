<?php

namespace App\Controller\Admin;

use App\Entity\Editeur;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class EditeurCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Editeur::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', "Identifaints")->hideOnForm(),
            TextField::new('nom','Nom')
        ];
    }

}
