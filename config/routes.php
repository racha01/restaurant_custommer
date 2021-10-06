<?php

// Define app routes

use Slim\App;
use Slim\Routing\RouteCollectorProxy;
use Tuupola\Middleware\HttpBasicAuthentication;
use App\Middleware\UserAuthMiddleware;

return function (App $app) {
    // Redirect to Swagger documentation
    $app->get('/index', \App\Action\LoginAction::class)->setName('login');
    $app->post('/index', \App\Action\IndexSubmitAction::class);
    // $app->get('/login', \App\Action\LoginAction::class)->setName('login');
    // $app->post('/login', \App\Action\LoginSubmitAction::class);
    $app->get('/logout', \App\Action\LogoutAction::class)->setName('logout');

    // Swagger API documentation
    $app->get('/docs/v1', \App\Action\Documentation\SwaggerUiAction::class)->setName('docs');

    $app->get('/suggest_menus', \App\Action\Web\SuggestMenuAction::class)->add(UserAuthMiddleware::class);

    // $app->get('/', \App\Action\Web\HomeAction::class)->setName('home')->add(UserAuthMiddleware::class);
    $app->get('/menus', \App\Action\Web\MenuAction::class)->add(UserAuthMiddleware::class);
    $app->post('/add_menu', \App\Action\Web\MenuAddAction::class)->add(UserAuthMiddleware::class);
    $app->post('/edit_menu', \App\Action\Web\MenuEditAction::class)->add(UserAuthMiddleware::class);



    $app->get('/members', \App\Action\Web\MemberAction::class)->add(UserAuthMiddleware::class);
    $app->post('/edit_member', \App\Action\Web\MemberEditAction::class)->add(UserAuthMiddleware::class);
    $app->post('/add_member', \App\Action\Web\MemberAddAction::class)->add(UserAuthMiddleware::class);

    $app->get('/type_foods', \App\Action\Web\TypeFoodAction::class)->add(UserAuthMiddleware::class);

    $app->get('/receipts', \App\Action\Web\ReceiptAction::class)->add(UserAuthMiddleware::class);
    
};
