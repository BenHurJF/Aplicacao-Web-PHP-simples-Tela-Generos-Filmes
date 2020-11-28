<html lang="pt-br">
    <head>
        <title>Filme Atualizado</title>
        <meta charset="utf-8">
    </head>

    <body>

<div class="container">
     <?php
        include 'conexao.php';
        if ($_POST["id"] || $_POST["nome"]) 
         {
         $idgenero = $_POST["id"];
         $nomeGenero = $_POST["nome"];

         try
         {
            $stmt = $con->prepare('UPDATE generos set nome= :nome WHERE idgeneros = :id');
            $stmt->execute(array (
                ':nome' => $nomeGenero,
                ':id' => $idgenero
            ));
 
            echo "<div>Genero Atualizado com sucesso!</div>". "<br>";
       
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