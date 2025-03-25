package com.DAO;

import java.util.List;
import com.entity.BookDtls;

public interface BookDAO {
    
    // Add a new book to the database
    boolean addBooks(BookDtls b);
    
    // Retrieve all books from the database
    List<BookDtls> getAllBooks();
    
    // Retrieve a book by its ID
    BookDtls getBookById(int id);
    
    // Update book details
    boolean updateBook(BookDtls b);

    // Delete a book by its ID
    boolean deleteBook(int id);
    
    // Fetch newly added books
    List<BookDtls> getNewBooks();

    // Fetch recently added books
    List<BookDtls> getRecentBooks();

    // Fetch old books (inactive or older uploads)
    List<BookDtls> getOldBooks();

    // Fetch books by category (e.g., Fiction, Science, etc.)
    List<BookDtls> getBooksByCategory(String category);

    // Fetch only active books (books that are available for sale)
    List<BookDtls> getActiveBooks();

    // Fetch books uploaded by a specific user
    List<BookDtls> getBooksByUser(String userEmail);
    
    List<BookDtls> getAllRecentBook();
    
    List<BookDtls> getAllNewBook();
    
    List<BookDtls> getAllOldBook();
    
    List<BookDtls> getBookBySearch(String ch);
}
