<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Scientific Evidence Dataset</h1>
 <img src="https://github.com/DanielSCustodio/swebok-dataset/assets/29557187/d71c4d32-d97c-4933-955d-029b47f910fc">

  <p>Bem-vindo ao projeto Scientific Evidence Dataset! Este projeto foi desenvolvido para facilitar a gestão e colaboração em questões relacionadas ao Corpo de Conhecimento em Engenharia de Software (SWEBOK).</p>
  <h2>Visão Geral</h2>
  <p>O projetoScientific Evidence Dataset tem como objetivo fornecer uma plataforma centralizada para rastrear e abordar várias questões e tópicos dentro do framework SWEBOK. Ele permite que os usuários:</p>
  <ul>
    <li>Crie e gerencie questões relacionadas a tópicos específicos do SWEBoK.</li>
    <li>Anexe e revise evidências para apoiar as questões identificadas.</li>
  </ul>
  <h2>Guia de Instalação</h2>
  <ol>
    <li>Clone este repositório usando o comando   <pre><code> git clone git@github.com:DanielSCustodio/swebok-dataset.git</code></pre></li>
    <li>Importe o arquivo <code>swebok.sql</code> (que se encontra na raiz projeto) para o seu banco de dados MySQL. Esse arquivo contém a estrutura de tabelas necessárias para o funcionamento do projeto.</li>
    <li>Crie um arquivo chamado  <code>.env.development.local </code> na raiz do projeto e adicione as seguintes informações de conexão do banco de dados, substituindo os valores xxx pelos dados corretos:</li>
    <pre><code>DB_PASS=xxx
DB_HOST=localhost
DB_USER=xxxx
DB_NAME=xxxx
PORT=xxx</code></pre>
    <li>Execute o comando <code>npm install</code> para instalar todas as dependências necessárias do projeto.</li>
    <li>Execute o comando <code>sass --watch styles/main.sass:public/css/style.css</code> para compilar o SASS em tempo real.</li>
    <li>Finalmente, execute o comando <code>npm start</code> para iniciar o servidor. O aplicativo estará disponível em <code>http://localhost:PORT/</code>, onde <code>PORT</code> é a porta especificada no arquivo <code>.env.development.local</code>.</li>
  </ol>

  <h2>Contribuindo</h2>
  <p>Sinta-se à vontade para contribuir com este projeto. Basta seguir os seguintes passos:</p>
  <ol>
    <li>Faça um fork deste repositório.</li>
    <li>Crie um branch com suas alterações (<code>git checkout -b minha-alteracao</code>).</li>
    <li>Commit suas alterações (<code>git commit -m "Minha alteração"</code>).</li>
    <li>Faça um push para o branch (<code>git push origin minha-alteracao</code>).</li>
    <li>Abra um Pull Request.</li>
  </ol>
</body>
</html>
