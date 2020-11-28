<?php   
    include 'conexao.php';
    $consulta = $con->query("SELECT idgeneros, nome FROM generos;");
?>

<!-- 
    NOME: BEN-HUR JEFFER FERREIRA DE SOUZA
    MATRICULA: 201902501901
-->

<html lang="pt-br">
 <head>
     
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
    <title>Cadastrar Generos de Filmes</title>
    <meta charset="utf-8">
 </head>
   
 <span>
     Nome: Ben-Hur Jeffer <br>
     Matricula: 201902501901
     </span>
 <body class="font1">

     <h2 class="fontTitulo container">Tela de Generos dos Filmes</h2>
      <br>

<div class="container">
 
       <form action="CadastrarGenero.php" method="POST">

       <label for="nome">Nome Genero: </label>
       <input class="styleInput" type="text" name="nome" id="nome" required> 
       <br><br>
       <input class="styleInput button" type="submit" value="Cadastrar">
      
       </form>
</div>
     <br>

     <h2 class="container">Generos Cadastrados</h2>
     <div class="container">
     <table class="corpoTabelaFilmes">
         <tr>
             <td>ID</td>
             <td>GENEROS</td>
             <td class="container">ACAO</td>
         </tr>
         <?php
         while ($linha = $consulta->fetch(PDO::FETCH_ASSOC)) { ?>
         <tr>
             <td> <?php echo $linha['idgeneros']; ?></td>
             <td> <?php echo $linha['nome']; ?></td>
             <td>
                 <a class="editar cor" href="EditarGeneros.php?id=<?php echo $linha['idgeneros']; ?>">Editar </a>
               | <a class="cor" href="ExcluirGeneros.php?id=<?php echo $linha['idgeneros']; ?>">Excluir</a>
            </td>
         </tr>
         <?php }   ?>
     </table>
     </div>
 </body>

 <style>
     body {
         background-color: #483D8B;
         color: white;
         padding: 17px;
     }
     input {
         color: black;
         padding: 5px;
         justify-content: center;
     }
     .fontTitulo {
        font-family: 'Nunito', sans-serif;
        font-size: 23pt;  
     }
     .font1 {
        font-family: 'Nunito', sans-serif;
        font-size: 16pt;
     }
     .container {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
     }
     .addFilme {
         background-color: gray;
         justify-content: center;
     }
     .cor {
         color: white;
     }
     .cor:hover {
         color: red;
     }
     .editar:hover {
         color: black;
     }
     .styleInput {
         outline: none;
         border-style: inherit;
         border-radius: 10px;
         padding: 5px;
         background-color: #A9A9A9;
     }
     .button {
         width: 100px;
         height: 33px;
         color: #483D8B;
     }
     .button:hover {
         background-color: brown;
         color: white;
     }
     .corpoTabelaFilmes {
         background-color: #6959CD;
         border-radius: 30px;
         padding: 20px;
     }
 </style>
</html>