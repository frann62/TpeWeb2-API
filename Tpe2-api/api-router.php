<?php
require_once './libs/Router.php';
require_once './app/Controller/ApiMousesController.php';

$router = new Router();

$router->addRoute('mouses', 'GET', 'ApiMousesController', 'getAll');
$router->addRoute('mouses/:ID', 'GET', 'ApiMousesController', 'get');
$router->addRoute('mouses', 'POST', 'ApiMousesController', 'insertMouse');


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
