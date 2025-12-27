package com.productimage.model;

import java.util.List;

public class ProductImageService {
	
	private ProductImageDAO_interface dao;
	
	public ProductImageService() {
		dao = new ProductImageJDBCDAO();
	}
	
	public ProductImageVO addProductImage(Integer prodno, String prodname, byte[] upfile) {
		
		ProductImageVO piVO = new ProductImageVO();
		piVO.setProdno(prodno);
		piVO.setUpfile(upfile);
		piVO.setUploaddate(new java.sql.Date(System.currentTimeMillis()));
		dao.insert(piVO);
		
		return piVO;
		
	}
	
	public ProductImageVO updateProductImage(Integer imgno, Integer prodno, String prodname, byte[] upfile) {
		
		ProductImageVO piVO = new ProductImageVO();
		piVO.setImgno(imgno);
		piVO.setProdno(prodno);
		piVO.setUpfile(upfile);
		piVO.setUploaddate(new java.sql.Date(System.currentTimeMillis()));
		dao.update(piVO);
		
		return piVO;
	}
	
	public void deleteImage(Integer imgno) {
		dao.delete(imgno);
	}
	
	public ProductImageVO getOneImage(Integer imgno) {
		return dao.findByPrimaryKey(imgno);
	} 
	
	public List<ProductImageVO> getAll(){
		return dao.getAll();
	}
	
	public String getProdNameByProdNo(Integer prodno) {
		return dao.getProdNameByProdNo(prodno);
	}

}
