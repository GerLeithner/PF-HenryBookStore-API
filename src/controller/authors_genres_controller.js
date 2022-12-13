const data = [
    {
        authors: ["Gabriel García Márquez", "Pablo Neruda", "Mario Vargas Llosa", "José Martí", "Jorge Luis Borges", "Julio Cortázar", "Isabel Allende", "Jorge Amado", "Miguel Asturias", "Jorge Amado"],
        genre: "latin american"
    },      
   { 
        authors: ["Julio Verne", "Philip K. Dick", "Isaac Asimov", "Arthur C. Clarke", "Robert A. Heinlein", "J. G. Ballard", "Frank Hebert", "Ursula K. Le Guin", "Adolfo Bioy Casares", "Mary Shelley"],
        genre: "science fiction" 
    },
    {
        authors: ["Margaret Atwood", "George Orwell", "Aldous Huxley", "Christina Dalcher", "Ray Bradbury", "Yevgeny Zamiatin", "Emily St. John Mandel", "Kazuo Ishiguro", "Scott Westerfeld", "H. G. Wells"],
        genre: "dystopias"
    },
   {    
        authors: ["Agatha Christie", "Sir Arthur Conan Doyle", "Louise Penny", "Ann Cleeves", "David Baldacci", "Gillian Flynn", "Stephen King", "Harlan Coben", "Lee Child", "James Patterson"],
        genre: "crime"
    },
   { 
        authors: ["George R. R. Martin", "Seanan McGuire", "Brandon Sanderson", "Patrick Rothfuss", "J.R.R. Tolkien", "Nnedi Okorafor", "Andrzej Sapkowski", "Naomi Novik", "Tamora Pierce", "J. K. Rowling"],
        genre: "fantasy"
    }, 
   {
        authors: ["William Shakespeare", "Sylvia Plath", "Ted Hughes", "Dante Alighieri", "Maya Angelou", "Sappho", "Lord Byron", "Li Bai", "Langston Hughes", "Emily Dickinson"],
        genre: "poetry"
    } 
];

let authors = [];
let genres = [];
let authorsAndGenres = [];

data.forEach(d => d.authors.forEach(a => {
    authorsAndGenres.push({ 
        author: a,
        genre: d.genre
    }) 
}));

data.forEach(item => {
    genres.push(item.genre);
    item.authors.forEach(author => {
        authors.push(author);
    })
});



module.exports = {
    authorsAndGenres,
    authors,
    genres,
}