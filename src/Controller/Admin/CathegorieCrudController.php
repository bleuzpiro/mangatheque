<?php

namespace App\Controller\Admin;

use App\Entity\Cathegorie;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class CathegorieCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Cathegorie::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', "Identifiants")->hideOnForm(),
            TextField::new('nom','Nom')

        ];
    }

}
