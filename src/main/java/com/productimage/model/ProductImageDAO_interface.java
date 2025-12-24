package com.productimage.model;

import java.util.List;

public interface ProductImageDAO_interface {
	public void insert(ProductImageVO piVO);
	public void update(ProductImageVO piVO);
	public void delete(Integer img_no);
	public ProductImageVO findByPrimaryKey(Integer img_no);
	public List<ProductImageVO> getAll();
}
