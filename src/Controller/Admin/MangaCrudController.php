<?php

namespace App\Controller\Admin;

use App\Entity\Manga;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CurrencyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;

class MangaCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Manga::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', 'Identifiants')->hideOnForm(),
            AssociationField::new('serie'),
            AssociationField::new('auteur'),
            IntegerField::new('tome'),
            IntegerField::new('nb_page'),
            MoneyField::new('prix_manga')->setCurrency('EUR')->setStoredAsCents(false),
            TextEditorField::new('desc_manga'),
            ImageField::new('chemin_image')->setUploadDir('Public/Images')->setBasePath('Images'),
            DateField::new('date')

        ];
    }

}
