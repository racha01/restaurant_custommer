<?php

namespace App\Action;

use App\Domain\Visitor\Service\VisitorFinder;
use App\Domain\Visitor\Service\VisitorUpdater;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Routing\RouteContext;
use Symfony\Component\HttpFoundation\Session\Session;

final class IndexSubmitAction
{
    /**
     * @var Session
     */
    private $session;
    private $finder;
    private $updater;

    public function __construct(Session $session,VisitorFinder $finder,VisitorUpdater $updater)
    {
        $this->session = $session;
        $this->finder=$finder;
        $this->updater=$updater;
    }

    public function __invoke(
        ServerRequestInterface $request,
        ResponseInterface $response
    ){
        $data = (array)$request->getParsedBody();
        $table_id = (int)($data['table_id'] ?? '');
        $number_of_people = (string)($data['number_of_people'] ?? '');

        $id=$this->updater->insertVisitor($data);

        $this->updater->updateVisitor($id, $data);

        $visitorRow = $this->finder->checkVisitor($id);

        
        // Pseudo example
        // Check user credentials. You may use an application/domain service and the database here.
        $visitor = null;
        
        // $userRow = $this->userLoginChecker->checkLogin($username,$password);
        
        if($visitorRow) {
            $visitor = $visitorRow;
        }

        // Clear all flash messages
        $flash = $this->session->getFlashBag();
        $flash->clear();

        // Get RouteParser from request to generate the urls
        $routeParser = RouteContext::fromRequest($request)->getRouteParser();

        if ($visitor) {
            // Login successfully
            // Clears all session data and regenerates session ID
            $this->session->invalidate();
            $this->session->start();
    
            $this->session->set('user', $visitor);
            $flash->set('success', 'Login successfully');
    
            // Redirect to protected page
            $url = 'suggest_menus';
        } else {
            $flash->set('error', 'Login failed!');

            // Redirect back to the login page
            $url = $routeParser->urlFor('login');
        }

        return $response->withStatus(302)->withHeader('Location', $url);
    }
}