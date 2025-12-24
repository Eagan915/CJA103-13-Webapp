package com.productimage.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.productimage.model.ProductImageService;

public class DisplayImageServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		
		try {
		Integer imgno = Integer.valueOf(req.getParameter("imgno"));
		ProductImageService piSvc = new ProductImageService();
		byte[] pic = piSvc.getOneImage(imgno).getUpfile();
		
		if(!(pic == null)) {
			out.write(pic);
			}
		}catch(Exception e) {
			
		}
	}

}
