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

import com.niit.dao.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Supplier;

@Controller
public class SupplierController 
{
	@Autowired
	SupplierDAO supplierDAO;
	
	boolean flag=true;
	
	@RequestMapping(value="/Supplier")
	public String showManageSupplier(Model m)
	{
		Supplier supplier=new Supplier();
		m.addAttribute("supplier",supplier);
		
		List<Supplier> supplierList=supplierDAO.listSupplier();
		m.addAttribute("supplierList",supplierList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/addSupplier",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.addSupplier(supplier);
		
		Supplier supplier1=new Supplier();
		m.addAttribute("supplier",supplier1);

		List<Supplier> supplierList=supplierDAO.listSupplier();
		m.addAttribute("supplierList",supplierList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/UpdateSupplier/{supplierId}",method=RequestMethod.POST)
	public String updateSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDAO.updateSupplier(supplier);
		
		Supplier supplier1=new Supplier();
		m.addAttribute("supplier",supplier1);

		List<Supplier> supplierList=supplierDAO.listSupplier();
		m.addAttribute("supplierList",supplierList);
		
		flag=false;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}",method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDAO.getSupplier(supplierId);
		
		supplierDAO.deleteSupplier(supplier);
		
		Supplier supplier1=new Supplier();
		m.addAttribute("supplier",supplier1);

		List<Supplier> supplierList=supplierDAO.listSupplier();
		m.addAttribute("supplierList",supplierList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/editSupplier/{supplierId}",method=RequestMethod.GET)
	public String editSupplier(@PathVariable("supplierId")int supplierId,@ModelAttribute("supplier")Supplier supplier,Model m)
	{	
		supplier=supplierDAO.getSupplier(supplierId);
				
		m.addAttribute("supplier",supplier);
		
		List<Supplier> supplierList=supplierDAO.listSupplier();
		m.addAttribute("supplierList",supplierList);
		
		flag=false;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	public LinkedHashMap<Integer,String> getSupplierList(List<Supplier> listSupplier)
	{
		LinkedHashMap<Integer,String> supplierData=new LinkedHashMap<Integer,String>();
		
		int count=0;
		while(count<listSupplier.size())
		{
			supplierData.put(listSupplier.get(count).getSupplierId(),listSupplier.get(count).getSupplierName());
			count++;
		}
		return supplierData;
	}
}