const { Author } = require("../db")

const CompleteAuthors = [
    {
        names: ["Gabriel García Márquez", "Pablo Neruda", "Mario Vargas Llosa", "José Martí", "Jorge Luis Borges", "Julio Cortázar", "Isabel Allende", "Jorge Amado", "Miguel Asturias", "Jorge Amado"],
        genre: "latin american"
    },      
   { 
        names: ["Julio Verne", "Philip K. Dick", "Isaac Asimov", "Arthur C. Clarke", "Robert A. Heinlein", "J. G. Ballard", "Frank Hebert", "Ursula K. Le Guin", "Adolfo Bioy Casares", "Mary Shelley"],
        genre: "science fiction" 
    },
    {
        names: ["Margaret Atwood", "George Orwell", "Aldous Huxley", "Christina Dalcher", "Ray Bradbury", "Yevgeny Zamiatin", "Emily St. John Mandel", "Kazuo Ishiguro", "Scott Westerfeld", "H. G. Wells"],
        genre: "dystopias"
    },
   {    
        names: ["Agatha Christie", "Sir Arthur Conan Doyle", "Louise Penny", "Ann Cleeves", "David Baldacci", "Gillian Flynn", "Stephen King", "Harlan Coben", "Lee Child", "James Patterson"],
        genre: "crime"
    },
   { 
        names: ["George R. R. Martin", "Seanan McGuire", "Brandon Sanderson", "Patrick Rothfuss", "J.R.R. Tolkien", "Nnedi Okorafor", "Andrzej Sapkowski", "Naomi Novik", "Tamora Pierce", "J. K. Rowling"],
        genre: "fantasy"
    }, 
   {
        names: ["William Shakespeare", "Sylvia Plath", "Ted Hughes", "Dante Alighieri", "Maya Angelou", "Sappho", "Lord Byron", "Li Bai", "Langston Hughes", "Emily Dickinson"],
        genre: "poetry"
    } 
];

authors = ["Gabriel García Márquez", "Pablo Neruda"] // , "Julio Verne", "Philip K. Dick", "Margaret Atwood", "George Orwell", "Agatha Christie", "Sir Arthur Conan Doyle", "George R. R. Martin","William Shakespeare", "Sylvia Plath"];

async function getAuthor(){    
    authors.forEach(e=>{
        Author.findOrCreate({
            where: {name:e}
        })
    })

    return authors
}

async function getAuthorByName(name) {
    return await Author.findOne({
        where: { name }
    })
}

module.exports = {
    getAuthor,
    getAuthorByName
}
