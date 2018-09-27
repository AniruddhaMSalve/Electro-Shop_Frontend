package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
public class ProductController 
{
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	boolean flag=true;
	
	@RequestMapping(value="/Product")
	public String showManageProduct(Model m)
	{
		Product product=new Product();
		m.addAttribute("product",product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		flag=true;
		m.addAttribute("flag",flag);
		return "Product";
	}
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product,@RequestParam("pimage")MultipartFile fileDetail,Model m,BindingResult result)
	{
		productDAO.addProduct(product);
		
		String imagePath="B:\\Java_Workspace_01\\Project_01_Frontend\\src\\main\\webapp\\resources\\images\\";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg"; 
		File myFile=new File(imagePath);
		
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte[] fileBytes=fileDetail.getBytes();
				FileOutputStream fos=new FileOutputStream(myFile);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBytes);
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("errorInfo","Exception Arised:"+e);
			}
		}
		else
		{
				m.addAttribute("errorInfo","Error while uploading the image");
		}
	
		Product product1=new Product();
		m.addAttribute("product",product1);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "Product";
	}
	
	
	@RequestMapping(value="/deleteProduct/{productId}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		productDAO.deleteProduct(product);
		
		Product product1=new Product();
		m.addAttribute("product",product1);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "Product";
	}
	
	
	@RequestMapping(value="/editProduct/{productId}")
	public String editProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		m.addAttribute("product",product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		flag=false;
		m.addAttribute("flag",flag);
		
		return "Product";
	}
	
	
	
	@RequestMapping(value="/updateProduct/{productId}",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.updateProduct(product);
		
		Product product1=new Product();
		m.addAttribute("product",product1);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);

		List<Category> categoryList=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.getCategoryList(categoryList));
		
		flag=false;
		m.addAttribute("flag",flag);
		
		return "Product";
	}
	
	@RequestMapping("/ProductCatalog")
	public String displayAllProducts(Model m)
	{
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		return "ProductCatalog";
	}
	
	
	@RequestMapping("/ProductDisplay/{productId}")
	public String displaySingleProducts(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		m.addAttribute("product",product);
		m.addAttribute("categoryName",categoryDAO.getCategory(product.getCategoryId()).getCategoryName());
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		return "ProductDisplay";
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
}