const api_url = "http://127.0.0.1:5000";

async function tela_de_login() {
  const resposta = await fetch(`${api_url}/login`);

  if (!resposta.ok) {
    console.log("nao foi possivel se conectar ao backend");
    return;
  }
  const dado = resposta.json();
  alert(`conectou. ${dado}`);
}
