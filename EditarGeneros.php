<html lang="pt-br">
 <head>
    <title>Editar Genero</title>
    <meta charset="utf-8">
 </head>

 <body>

  <?php
     include 'conexao.php';
     if ($_GET["id"]) 
      {
      $idgenero = $_GET["id"];
      try
      {
        $consulta = $con->query("SELECT idgeneros, nome FROM generos ". "WHERE idgeneros = $idgenero;");
        
      }
      catch (PDOException $extou) 
      {
          echo "<div>Ocorreu um erro: ". $extou->getMessage(). "</div>";
      }
     }
  ?>
<div class="container">
   <form action="GeneroEditado.php" method="POST">
       <label for="nome">Alterar Genero: </label>
       <?php 
       while ($linha = $consulta->fetch(PDO::FETCH_ASSOC)) {
       ?>
       <input class="style" type="hidden" id="id" name="id" value="<?php echo $linha['idgeneros']; ?>">
       <input class="style" type="text" name="nome" id="nome" required value="<?php echo $linha['nome']; ?>"> 
       <?php } ?>
       <br><br>
       <input class="style" type="submit" value="Atualizar">
     </form>
</div>

 </body>
 <style>
     body {
         background-color: #483D8B;
         color: white;
         padding: 17px;
     }
     .style {
         outline: none;
         border-style: inherit;
         border-radius: 10px;
         padding: 5px;
     }
     .container {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
     }
 </style>
</html>