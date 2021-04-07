<?php

namespace App\Controller\Admin;

use App\Entity\Serie;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class SerieCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Serie::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', 'Identifiants')->hideOnForm(),
            TextField::new('nom','Nom'),
            ChoiceField::new('etat','Etat d\'avancement')->setChoices(['Finit' => '1','Pas Finit' => '0']),
            AssociationField::new('Serie_Cathegorie','Catégorie'),
            AssociationField::new('Serie_Editeur','Editeur'),
            IntegerField::new('nombresDeTomes','Nombres de tomes'),
        ];
    }

}
