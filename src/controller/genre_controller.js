const fetch = require("node-fetch");
const { authors } = require("../controller/author_controller");
const { Genre } = require("../db")

async function getApiGenre(){
    let arrayApi = []
    let setGenre = new Set()
    let genreApi = authors.map(async author => await fetch(`https://www.googleapis.com/books/v1/volumes?q=inauthor:"${author}"keyes`).then(r => r.json()));
    let genre = await Promise.all(genreApi);

    let itemsArray = genre.map(obj => obj.items);
    itemsArray.map(item => item.map(book => arrayApi.push(book)));
    let genreArray = arrayApi.map(el => el.volumeInfo.categories);
    
    repGen = genreArray.join().split(",")
    repGen.map(el => setGenre.add(el))
    
    let genreFinal=[]

    setGenre.forEach(e => {
        if(e.length) genreFinal.push(e)
    })

    // creeria que acá está el mismo problema de que no devuelve las entidades 
    // de la db. Sino el arreglo. 
    // genreFinal.forEach(e=>{
    //     Genre.findOrCreate({
    //         where: {name:e}
    //     })
    // })
    // return genreFinal
  
    let genrePromises = genreFinal.map(async genre => {
        let dbGenre = await Genre.create({ name: genre });
        return dbGenre;
    })
    let dbGenres = await Promise.all(genrePromises);

    return dbGenres;
}

async function getGenreIdByName(name) {
    let genre = await Genre.findOne({
        where: { name }
    });
    return genre.id;
}

module.exports = {
    getApiGenre,
    getGenreIdByName
}