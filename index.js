function laCajaDePandora(numero){
    // proximamente escribiremos codigo aqui
    if(numero % 2 === 0) {
        return (numero >>> 0).toString(2);
    } else {
        return numero.toString(16);
    }
    
    }

    function gabriel() {
        return {
            nombre: 'Gabriel',
            edad: 30,
            nacionalidad: 'Argentino'
        }
    }