package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class UpdateProductAction extends Action{

	public String execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		String prodNo = (String)request.getParameter("prodNo");
		
		ProductService productService = new ProductServiceImpl();
		
		Product product= productService.getProduct(Integer.parseInt(prodNo));
		product.setProdName(request.getParameter("prodName"));
		product.setProdDetail(request.getParameter("prodDetail"));
		product.setManuDate(request.getParameter("manuDate"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setFileName(request.getParameter("fileName"));
		
		System.out.println(product);
		
		ProductService service=new ProductServiceImpl();
		service.updateProduct(product);
		
		/*
		HttpSession session=request.getSession();
		String sessionId=((Product)session.getAttribute("product")).getProdNo());
		
		if(sessionId.equals(prodNo)){
			session.setAttribute("product", prod);
		}
		*/
		
		return "redirect:/getProduct.do?prodNo="+prodNo;
	}
	
}
