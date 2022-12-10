const fetch = require("node-fetch");
const {getAuthor} = require("../controller/author_controller");
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
    genreFinal.forEach(e=>{
        Genre.findOrCreate({
            where: {name:e}
        })
    })

    return genreFinal
}

async function getGenreIdByName(name) {
    let genre = await Genre.findOne({
        where: { name }
    });
    let genreId = genre.id;
    return genreId;
}

module.exports = {
    getApiGenre,
    getGenreIdByName
}