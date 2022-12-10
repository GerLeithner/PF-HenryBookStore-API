const { Author } = require("../db");
const { getDbBooks } = require("./book_controller");

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

let authors = ["Gabriel García Márquez", "Pablo Neruda"] // , "Julio Verne", "Philip K. Dick", "Margaret Atwood", "George Orwell", "Agatha Christie", "Sir Arthur Conan Doyle", "George R. R. Martin","William Shakespeare", "Sylvia Plath"];

// REVISAR: esto me parece que devuelve directamente authors como estaba
// no se si es correcto esto pues no son de la db... por ende no tienen id
// entonces no se puede hacer el set desde el book. ah ah pero si se crean en la db
// osea que luego los puedo buscar y setear, pero igual deberia devolver la entidad con id y todo.
// async function getAuthors(){   
//     authors.forEach(author => {
//         Author.findOrCreate({
//             where: { name: author }
//         })
//     })

//     return authors
// }

function createJsonAuthors() {
    return authors.map(author => {
        return { name: author }
    })
}

async function createDbAuthors(){   
    let jsonAuthors = createJsonAuthors();
    let newAuthors = await Author.bulkCreate(jsonAuthors, { ignoreDuplicates: true });
    return newAuthors;
}

async function getDbAuthors() {
    let dbAuthors = await Author.findAll();
    return dbAuthors;
}

async function getAuthorIdByName(name) {
    let author = await Author.findOne({
        where: { name }
    });
    let authorId = author.id
    return authorId;
}

module.exports = {
    authors,
    createDbAuthors,
    getDbAuthors,
    getAuthorIdByName
}
