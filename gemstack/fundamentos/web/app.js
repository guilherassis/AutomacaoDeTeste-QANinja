

function enviaCadastro(){
    var nome = document.getElementById("name").value;
    var email = document.getElementById("email").value;
          
    if(nome == ''){
        alert ('Nome é obrigatório!')
        return false
    }

    if(email == ''){
        alert ('Email é obrigatório!')
        return false
    }

    var cadastro = {
        nome:nome,
        email: email,
        opcoes : document.getElementById("opcoes").value,
        novidades : document.getElementById("novidades").checked
    }

    console.log(cadastro)
}