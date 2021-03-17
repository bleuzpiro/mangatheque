<?php

namespace App\Controller\Admin;

use App\Entity\Admin;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class AdminCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Admin::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', "Identifaints")->hideOnForm(),
            TextField::new('username','Noms d\'utilisateurs'),
            ChoiceField::new('roles','Roles')->setChoices(["ADMIN"=>"ROLE_ADMIN","USER"=>"ROLE_USER"])->allowMultipleChoices(),
            TextField::new('password','Mots De Passes')
        ];
    }
    
}
