package com.niit.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CategoryDAO;
import com.niit.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;

	boolean flag = true;

	@RequestMapping(value = "/Category")
	public String showManageCategory(Model m) {
		Category category = new Category();
		m.addAttribute("category", category);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", categoryList);

		flag = true;
		m.addAttribute("flag", flag);

		return "Category";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category, Model m) {
		categoryDAO.addCategory(category);

		Category category1 = new Category();
		m.addAttribute("category", category1);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", categoryList);

		flag = true;
		m.addAttribute("flag", flag);

		return "Category";
	}

	@RequestMapping(value="/UpdateCategory/{categoryId}", method = RequestMethod.POST) 
	  public String updateCategory(@ModelAttribute("category")Category category,Model m) 
	  {
		  categoryDAO.updateCategory(category);
		  
		  Category category1=new Category(); 
		  m.addAttribute("category",category1);
	  
		  List<Category> categoryList=categoryDAO.listCategories();
		  m.addAttribute("categoryList",categoryList);
	  
		  flag=false; m.addAttribute("flag",flag);
	  
		  return "Category"; 
	  }
	 

	@RequestMapping(value = "/deleteCategory/{categoryId}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("categoryId") int categoryId, Model m) {
		Category category = categoryDAO.getCategory(categoryId);

		categoryDAO.deleteCategory(category);

		Category category1 = new Category();
		m.addAttribute("category", category1);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", categoryList);

		flag = true;
		m.addAttribute("flag", flag);

		return "Category";
	}

	@RequestMapping(value = "/editCategory/{categoryId}")
	public String editCategory(@PathVariable("categoryId") int categoryId,Model m) {
		Category category = categoryDAO.getCategory(categoryId);

		m.addAttribute("category", category);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", categoryList);

		flag = false;
		m.addAttribute("flag", flag);

		return "Category";
	}

	public LinkedHashMap<Integer, String> getCategoryList(List<Category> listCategory) {
		LinkedHashMap<Integer, String> categoryData = new LinkedHashMap<Integer, String>();

		int count = 0;
		while (count < listCategory.size()) {
			categoryData.put(listCategory.get(count).getCategoryId(), listCategory.get(count).getCategoryName());
			count++;
		}
		return categoryData;
	}
}