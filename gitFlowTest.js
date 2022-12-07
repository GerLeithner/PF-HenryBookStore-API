function laCajaDePandora(numero) {
    if(numero % 2 === 0) {
        return (numero >>> 0).toString(2);
    } else {
        return numero.toString(16);
    }
}

function german() {
    return {
        name: "Germán",
        age: 29,
        nationality: "argentine"
    }
}

function kevin(){
    return {
        nombre: "Kevin Tavara",
        edad: 25,
        nacionalidad: "Peru"
    }
}
  

function gabriel() {
    return {
        nombre: 'Gabriel',
        edad: 30,
        nacionalidad: 'Argentino'
    }
}

function andrea() {
    return {
        nombre: "Andrea",
        edad: "24",
        nacionalidad: "Argentina",
    }
}