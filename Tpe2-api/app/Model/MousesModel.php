<?php

class MousesModel{

    private $db;
    function __construct(){
         $this->db = new PDO('mysql:host=localhost;'.'dbname=db_mouses;charset=utf8', 'root', '');
    }

    ///Obtener todos los mouses
    function getMouses(){
        $query = $this->db->prepare( "SELECT mouses.*, marcas.marca_name as marca FROM mouses JOIN marcas ON mouses.id_marca = marcas.id_marca");
        $query->execute();
        $mouses = $query->fetchAll(PDO::FETCH_OBJ);
        return $mouses;
    } 

    ///Obtener un mouse por id
    function getMouse($id){
        $query = $this->db->prepare( "SELECT mouses.*, marcas.marca_name as marca FROM mouses JOIN marcas ON mouses.id_marca = marcas.id_marca WHERE id_producto = ?");
        $query->execute(array($id));
        $mouse = $query->fetch(PDO::FETCH_OBJ);
        return $mouse;
    } 

    ///Obtener marcas
    function getMarcas(){
        $query = $this->db->prepare( "select * from marcas");
        $query->execute();
        $marcas = $query->fetchAll(PDO::FETCH_OBJ);
        return $marcas;
    }

    ///Obtener mouse por orden
    function getOrder() {
        $query = $this->db->prepare("SELECT * FROM mouses ORDER BY precio ASC");
        $query->execute();
        $mouses = $query->fetchAll(PDO::FETCH_OBJ);
        return $mouses; 
    }

    ///Obtener mouses por marca
     function getMousesPorMarca($filtro){
        $query = $this->db->prepare("SELECT mouses.*, marcas.marca_name as marca FROM mouses JOIN marcas ON mouses.id_marca = marcas.id_marca WHERE mouses.id_marca = $filtro");
        $query->execute();
        $mouses = $query->fetchAll(PDO::FETCH_OBJ);
        return $mouses;
     }

    ///Insertar mouse a la DB
    function insertMousesDeBD($nombre, $stock, $precio, $id_marca){
        $query = $this->db->prepare("INSERT INTO mouses(nombre, stock, precio, id_marca) VALUES(?, ?, ?, ?)");
        $query->execute(array($nombre, $stock, $precio, $id_marca));
        return $this->db->lastInsertID();
    }

    ///Eliminar mouse de la DB
    function deleteMousesDeBD($id){
        $query = $this->db->prepare("DELETE FROM mouses WHERE id_producto=?");
        $query->execute(array($id));
    }

    ///Editar mouse de la DB
    function updateMousesDeBD($id, $action){
        $query = $this->db->prepare("UPDATE mouses SET stock = ? WHERE id_producto=?");
        $query->execute(array($action, $id));
    }   
}