package com.productimage.model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductImageJDBCDAO implements ProductImageDAO_interface {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Taipei";
	private static final String userid = "root";
	private static final String passwd = "eagle890915";

	
	private static final String INSERT_STMT = "INSERT INTO product_image (prod_no, prod_name, upload_date, up_file) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "select* from product_image";
	private static final String GET_ONE_STMT = "select* from product_image where img_no = ?";
	private static final String DELETE = "DELETE from product_image where img_no = ?";
	private static final String UPDATE = "UPDATE product_image set prod_no = ?, prod_name=?, upload_date = ?, up_file = ? where img_no = ?";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(ProductImageVO piVO) {
		String[] cols = { "img_no" };
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(INSERT_STMT, cols);) {

			pstmt.setInt(1, piVO.getProdno());
			pstmt.setString(2, piVO.getProdname());
			pstmt.setDate(3, piVO.getUploaddate());
			pstmt.setBytes(4, piVO.getUpfile());

			pstmt.executeUpdate();
			
			try(ResultSet rs = pstmt.getGeneratedKeys()){
				if(rs.next()) {
					Integer imgno = rs.getInt(1);
					piVO.setImgno(imgno);
				}
			}

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	@Override
	public void update(ProductImageVO piVO) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(UPDATE)) {

			pstmt.setInt(1, piVO.getProdno());
			pstmt.setString(2, piVO.getProdname());
			pstmt.setDate(3, piVO.getUploaddate());
			pstmt.setBytes(4, piVO.getUpfile());
			pstmt.setInt(5, piVO.getImgno());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	@Override
	public void delete(Integer imgno) {
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(DELETE)) {

			pstmt.setInt(1, imgno);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		}

	}

	@Override
	public ProductImageVO findByPrimaryKey(Integer imgno) {
		ProductImageVO piVO = null;
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(GET_ONE_STMT);) {

			pstmt.setInt(1, imgno);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					piVO = new ProductImageVO();
					piVO.setImgno(rs.getInt("img_no"));
					piVO.setProdno(rs.getInt("prod_no"));
					piVO.setProdname(rs.getString("prod_name"));
					piVO.setUploaddate(rs.getDate("upload_date"));
					piVO.setUpfile(rs.getBytes("up_file"));

				}
			}

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return piVO;
	}

	@Override
	public List<ProductImageVO> getAll() {
		List<ProductImageVO> list = new ArrayList<ProductImageVO>();
		ProductImageVO piVO = null;
		try (Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement(GET_ALL_STMT);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				piVO = new ProductImageVO();
				piVO.setImgno(rs.getInt("img_no"));
				piVO.setProdno(rs.getInt("prod_no"));
				piVO.setProdname(rs.getString("prod_name"));
				piVO.setUploaddate(rs.getDate("upload_date"));
				piVO.setUpfile(rs.getBytes("up_file"));
				list.add(piVO);

			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return list;
	}
	
	public String getProdNameByProdNo(Integer prodno) {
		String prodname = "";
		try(Connection con = DriverManager.getConnection(url, userid, passwd);
				PreparedStatement pstmt = con.prepareStatement("select prod_name from product_image where prod_no = ?")){
			pstmt.setInt(1, prodno);
			try(ResultSet rs= pstmt.executeQuery()){
				if (rs.next()) {
	                prodname = rs.getString("prod_name");
	            }
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodname;
	}
	
//	public static void main(String[] args) {
//		ProductImageJDBCDAO dao = new ProductImageJDBCDAO();
//		ProductImageVO piVO = dao.findByPrimaryKey(3001);
//		System.out.print(piVO.getImgno() + ",");
//		System.out.print(piVO.getProdno() + ",");
//		System.out.print(piVO.getProdname() + ",");
//		System.out.print(piVO.getUploaddate() + ",");
//		System.out.print(piVO.getUpfile() + ",");
//	}
	
//	public static void main(String[] args) {
//		ProductImageJDBCDAO dao = new ProductImageJDBCDAO();
//		ProductImageVO piVO = new ProductImageVO();
//		
//		piVO.setProdno(2001);
//		piVO.setProdname("真皮運動方向盤套");
//		piVO.setUploaddate(new java.sql.Date(System.currentTimeMillis()));
//		
//		try {
//			File file = new File("C:/Users/TMP-214/Pictures/17134613.png");
//			byte[] pic = Files.readAllBytes(file.toPath());
//			piVO.setUpfile(pic);
//		}catch(IOException e){
//			e.printStackTrace();
//		}
//		dao.insert(piVO);
//		
//	}
	
//	public static void main(String[] args) {
//		ProductImageJDBCDAO dao = new ProductImageJDBCDAO();
//		ProductImageVO piVO = new ProductImageVO();
	
//		ProductImageVO piVO = dao.findByPrimaryKey(3021);
//		piVO.setProdno(2020);
//		piVO.setProdname("車用空氣清淨機");
//		dao.update(piVO);
//	} 

//	public static void main(String[] args) {
//		ProductImageJDBCDAO dao = new ProductImageJDBCDAO();
//		dao.delete(3021);
//		System.out.println("刪除成功");
//		
//	} 
	
//	public static void main(String[] args) {
//		ProductImageJDBCDAO dao = new ProductImageJDBCDAO();
//		List<ProductImageVO> list = dao.getAll();
//		for (ProductImageVO piVO : list) {
//			System.out.print("圖片編號:"+piVO.getImgno()+"，");
//			System.out.print("商品編號:"+piVO.getProdno()+"，");
//			System.out.print("商品名稱:"+piVO.getProdname()+"，");
//			System.out.print("商品編號:"+piVO.getProdno()+"，");
//			System.out.print("上傳時間:"+piVO.getUploaddate()+"，");
//			
//			byte[] pic = piVO.getUpfile();
//			if(pic != null) {
//				System.out.println("圖片大小:" + pic.length + "bytes");
//			}else {
//				System.out.println("尚無圖片");
//			}
//		}
//		System.out.println("執行完成");
//	} 
	

}
