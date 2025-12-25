package com.productimage.controller;

import java.io.IOException;
import java.io.InputStream;

import com.productimage.model.ProductImageService;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DisplayImage")
public class DisplayImageServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		res.setContentType("image/gif, image/png");
		ServletOutputStream out = res.getOutputStream();
		
		try {
		Integer imgno = Integer.valueOf(req.getParameter("imgno"));
		ProductImageService piSvc = new ProductImageService();
		byte[] pic = piSvc.getOneImage(imgno).getUpfile();
		
		if(!(pic == null)) {
			out.write(pic);
			}
		}catch(Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/resources/image/17134613.png");
			byte[] error = in.readAllBytes();
			out.write(error);
			in.close();
		}
	}

}
