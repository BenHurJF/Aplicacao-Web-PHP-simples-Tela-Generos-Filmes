<html lang="pt-bt">
<head>
    <meta charset="utf-8">
    <title>Excluir Filme</title>
</head>

<body>
     
<div class="container">
    <?php   
       include 'conexao.php';
       if ($_GET["id"]) 
        {
        $idgenero = $_GET["id"];
        try
        {
           $stmt = $con->prepare('DELETE FROM generos WHERE idgeneros = :id');
           $stmt->bindParam(':id', $idgenero);
           $stmt->execute();

           echo "<div>Genero Excluido com sucesso!</div>";
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