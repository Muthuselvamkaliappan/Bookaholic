package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {
    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Add a new book
    @Override
    public boolean addBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_dtls(bookName,author,price,bookCategory,status,photo,user_email) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            f = (i == 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Fetch all books
    @Override
    public List<BookDtls> getAllBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Fetch book by ID
    @Override
    public BookDtls getBookById(int id) {
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM book_dtls WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = extractBook(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    // Update book details
    @Override
    public boolean updateBook(BookDtls b) {
        boolean updated = false;
        try {
            String sql = "UPDATE book_dtls SET bookName=?, author=?, price=?, status=? WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());

            updated = (ps.executeUpdate() > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    // Delete book
    @Override
    public boolean deleteBook(int id) {
        boolean success = false;
        try {
            String query = "DELETE FROM book_dtls WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            success = (ps.executeUpdate() == 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Fetch new books (limit 4 for homepage)
    @Override
    public List<BookDtls> getNewBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // Fetch books by category
    @Override
    public List<BookDtls> getBooksByCategory(String category) {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE bookCategory=? AND status=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Fetch active books
    @Override
    public List<BookDtls> getActiveBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Fetch books uploaded by a specific user
    @Override
    public List<BookDtls> getBooksByUser(String userEmail) {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE user_email=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Fetch recent books
    @Override
    public List<BookDtls> getRecentBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 

    // Fetch old books (inactive books)
    
    public List<BookDtls> getOldBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls WHERE status=? ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Inactive");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // Helper method to extract book details from ResultSet
    private BookDtls extractBook(ResultSet rs) throws Exception {
        BookDtls b = new BookDtls();
        b.setBookId(rs.getInt("bookId"));
        b.setBookName(rs.getString("bookName"));
        b.setAuthor(rs.getString("author"));
        b.setPrice(rs.getString("price"));
        b.setBookCategory(rs.getString("bookCategory"));
        b.setStatus(rs.getString("status"));
        b.setPhotoName(rs.getString("photo"));
        b.setEmail(rs.getString("user_email"));
        return b;
    }

	@Override
	public List<BookDtls> getAllRecentBook() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	@Override
	public List<BookDtls> getAllOldBook() {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, "Inactive");
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
    
    
    
    
    
}
