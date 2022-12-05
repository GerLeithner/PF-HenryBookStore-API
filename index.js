function laCajaDePandora(n){
    return n % 2 === 0 ? n.toString(2) : n.toString(16);
}

// function decToBin(num) {

//     let bin = "";
//     while(num >= 1){
//       bin = (num % 2).toString() + bin; 
//       num = Math.floor(num / 2);
//     }
//     return bin;
// }