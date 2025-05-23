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
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String SQL = "INSERT  into book_dtls(bookname,author,price,bookCategory,status,photo,user_email) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls";
			PreparedStatement ps = conn.prepareStatement(SQL);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {

		BookDtls b = null;
		try {

			String SQL = "SELECT * FROM book_dtls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String SQL = "UPDATE book_dtls SET bookname=?, author=?, price=?, status=? WHERE bookId=?";

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deletebooks(int id) {
		boolean f = false;
		try {
			String SQL = "DELETE FROM book_dtls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDtls> getNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDtls> getOldBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String SQL = "SELECT * FROM book_dtls WHERE bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<BookDtls> getBookByOld(String email, String cate) 
	{
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String SQL = "SELECT * FROM book_dtls WHERE bookCategory=? and user_email=?";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet  rs = ps.executeQuery();
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
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		

		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String SQL = "DELETE FROM book_dtls WHERE bookCategory=? and user_email=? and bookId=?";
			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return f;
	}
	
	 @Override
	public List<BookDtls> getBookBySearch(String ch) {
		 
		 List<BookDtls> list = new ArrayList<BookDtls>();
			BookDtls b = null;
			try {
				String SQL = "SELECT * FROM book_dtls WHERE bookname LIKE ? OR author LIKE ? OR bookCategory LIKE ? and status=?";
				PreparedStatement ps = conn.prepareStatement(SQL);
				ps.setString(1, "%"+ch+"%");
				ps.setString(2, "%"+ch+"%");
				ps.setString(3, "%"+ch+"%");
				ps.setString(4, "Active");
				
				ResultSet  rs = ps.executeQuery();
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
				
			} catch (Exception e) {
				 e.printStackTrace();
			}
			

			return list;
	}
}
