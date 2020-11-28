<html lang="pt-br">
 <head>
    <title>Cadastrar Generos de Filmes</title>
    <meta charset="utf-8">
 </head>

 <body>
<div class="container">
<?php
         include 'conexao.php';
         
         // Colocar Restricoes no nome
        //if ($_POST["nome"]) {
          //  if (preg_match("/[^A-Za-z'-]/", $_POST["nome"])) 
            // {
            // die ("Nome Invalido!");
          //  }
      //  }
        
        if ($_POST["nome"]) 
        {
        $nomeGenero = $_POST["nome"];
        try
        {
         $stmt = $con->prepare('INSERT INTO generos (nome) VALUES (:nome)');
         $stmt->execute(array (
            ':nome' => $nomeGenero
        ));

         echo "<div>Genero Cadastrado com sucesso!</div>";
         echo "<div> <a href=index.php>Pagina Inicial</a> </div>";
        }
        catch (PDOException $extou) 
        {
         echo "<div>Ocorreu um erro: ". $extou->getMessage(). "</div>";
        }
    }
?>
</div>
 </body>
 <style>
     body {
         background-color: gainsboro;
         color: black;
         padding: 17px;
     }
     .container {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
     }
 </style>
</html>