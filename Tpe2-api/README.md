
## Importar la base de datos
- importar desde PHPMyAdmin (o cualquiera) database/db_mouses.php


## Pueba con postman
El endpoint de la API es: 
http://localhost/tucarpetalocal/Tpe2-api/api/mouses  ///// Este sirve para traer todos los mouses o insertar un mouse

///////////////////

http://localhost/tucarpetalocal/Tpe2-api/api/mouses/:ID  ///// Este sirve para traer un mouse por ID del producto (id_product), EJ: http://localhost/tucarpetalocal/Tpe2-api/api/mouses/18 /// Me trae el mouse con ID 18

//////////////////

http://localhost/Tpe2-api/api/mouses?sort=precio&order=asc //// Este endpoint tiene los parametros "sort" que trae la columna "precio" de la tabla mouses y los ordena con el "order" de manera ascendente 



