<?php  

   $servidor = "localhost";
   $usuario = "usr_cinema";
   $senha = "cinem@";
   
   try
   {
      $con = new PDO("mysql:host=$servidor;dbname=cinema", $usuario, $senha, 
      array(
         PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
         PDO::ATTR_PERSISTENT => false,
         PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
      ));
        
       //echo "Conexao com o BD ok!". "<br>". "<br>"; Para Testar a CONEXAO

      //$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      //echo "Conexao com o BD, Esta ok!". "<br>". "<br>";
   }
   catch (PDOException $ex) 
   {
       echo "Erro na conexao com o BD: ". "<br>". $ex->getMessage();   
   }
?>