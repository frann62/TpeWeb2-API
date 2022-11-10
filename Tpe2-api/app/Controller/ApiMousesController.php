<?php
require_once "./app/Model/MousesModel.php";
require_once "./app/View/ApiView.php";

class ApiMousesController {
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new MousesModel();
        $this->view = new ApiView();
        
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    ///Obtener todos los mouses
    public function getAll() {
        if(isset($_GET['sort']) && isset($_GET['order'])){
            if ($_GET['sort'] == 'precio' && $_GET['order'] == 'asc') {
                $mouses = $this->model->getOrder($_GET['order'], $_GET['sort']);
            }           
        }
        else {
            $mouses = $this->model->getMouses();
        }
        return $this->view->response($mouses, 200);   
}

    ///Obtener un mouse por ID
    public function get($params = null) { 
        $id = $params[':ID'];
        $mouse = $this->model->getMouse($id);
        if ($mouse)
            $this->view->response($mouse, 200);
        else 
            $this->view->response("El mouse con el id=$id no existe", 404);
    }
    
   ///Insertar un mouse por POST
    public function insertMouse($params = null) {
        $mouse = $this->getData();
        if (isset($mouse->nombre)  && isset($mouse->stock)  && isset($mouse->precio)  && isset($mouse->id_marca)) {
            $id = $this->model->insertMousesDeBD($mouse->nombre, $mouse->stock, $mouse->precio, $mouse->id_marca);
            $mouse = $this->model->getMouse($id);
            if(!empty($mouse)){
            if($id != 0){
                $this->view->response($mouse, 201); 
            }
        }         
    }       else {
                $this->view->response("Complete los datos", 400);
                 }           
    }   
}