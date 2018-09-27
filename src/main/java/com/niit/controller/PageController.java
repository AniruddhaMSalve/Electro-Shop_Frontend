package com.niit.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
public class PageController 
{
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping(value="/Home")
	public String showHome(Model m)
	{
		Product product=new Product();
		m.addAttribute("product",product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		return "Home";
	}
	
	public LinkedHashMap<Integer,String> getCategoryList(List<Category> listCategory)
	{
		LinkedHashMap<Integer,String> categoryData=new LinkedHashMap<Integer,String>();
		
		int count=0;
		while(count<listCategory.size())
		{
			categoryData.put(listCategory.get(count).getCategoryId(),listCategory.get(count).getCategoryName());
			count++;
		}
		return categoryData;
	}
	
	@RequestMapping(value="/Login")
	public String Login()
	{
		return "Login";
	}
	
	@RequestMapping("/Register")
	public String Register()
	{
		return "Register";
	}
	
	@RequestMapping("/ContactUs")
	public String ContactUs()
	{
		return "ContactUs";
	}
	
	@RequestMapping("/AboutUs")
	public String AboutUs()
	{
		return "AboutUs";
	}
}