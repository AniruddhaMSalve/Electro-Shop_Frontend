package com.niit.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.CartItem;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class CartController 
{
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartDAO cartDAO;
	
	public long calcGrandTotalValue(List<CartItem> listCartItems)
	{
		int count=0;
		long grandTotalPrice=0;
		while(count<listCartItems.size())
		{
			grandTotalPrice+=(listCartItems.get(count).getQuantity()*listCartItems.get(count).getPrice());
			count++;	
		}
		return grandTotalPrice;
	}
	
	@RequestMapping(value="/Cart")
	public String showManageCart(@ModelAttribute("user")User user,HttpSession session,Model m)
	{
		CartItem cartItem=new CartItem();
		m.addAttribute("cartItem",cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		
		return "Cart";
	}
	
	@RequestMapping(value="/PaidStatus")
	public String showManageCartPS(@ModelAttribute("user")User user,HttpSession session,Model m)
	{
		CartItem cartItem=new CartItem();
		m.addAttribute("cartItem",cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		
		return "PaidStatus";
	}
	
	@RequestMapping("/addToCart/{productId}")
	public String addToCart(@ModelAttribute("product")Product product,@PathVariable("productId")int productId,@RequestParam("quantity")int quantity,@ModelAttribute("user")User user,HttpSession session,Model m)
	{
		product=productDAO.getProduct(productId);
		
		CartItem cartItem=new CartItem();
		
		String username=(String)session.getAttribute("username");

		cartItem.setUsername(username);
		cartItem.setProducId(product.getProductId());
		cartItem.setProductName(product.getProductName());
		cartItem.setPrice(product.getPrice());
		cartItem.setQuantity(quantity);
		cartItem.setPstatus("NP");
		
		System.out.println("ProductId :"+product.getProductId()+"Quantity of product :"+product.getQuantity()+"Quantity in cart :"+cartItem.getQuantity());

		int i=product.getQuantity()-cartItem.getQuantity();
		
		System.out.println("Product Quantity Updated :"+i);
		
		product.setQuantity(i);
		productDAO.updateProduct(product);
		
		m.addAttribute("cartItems",cartDAO.addCartItem(cartItem));	
		m.addAttribute("cartItem",cartItem);
		
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		return "Cart";
	}
	
	
	
	@RequestMapping(value="/UpdateCartItem/{cartItemId}")
	public String UpdateCartItem(@PathVariable("cartItemId")int cartItemId,@RequestParam("quantity")int quantity,Model m,HttpSession session)
	{
		CartItem cartItem=cartDAO.getCartItem(cartItemId);
		cartItem.setQuantity(quantity);
		cartDAO.updateCartItem(cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<CartItem> listCartItems=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItems",cartDAO.retrieveCartItems(username));
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(listCartItems));
		m.addAttribute("cartItem",cartItem);
		
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		return "Cart";
	}
	
	@RequestMapping(value="/deleteCartItem/{cartItemId}")
	public String deleteCartItem(@PathVariable("cartItemId")int cartItemId,Model m,HttpSession session)
	{
		CartItem cartItem=cartDAO.getCartItem(cartItemId);
		cartDAO.deleteCartItem(cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<CartItem> listCartItems=cartDAO.retrieveCartItems("username");
		m.addAttribute("cartItems",cartDAO.retrieveCartItems(username));
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(listCartItems));
		m.addAttribute("cartItem",cartItem);
		
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		return "Cart";
	}
	
	@RequestMapping(value="/PaidStatus/{cartItemId}")
	public String PaidStatus(@PathVariable("cartItemId")int cartItemId,Model m,HttpSession session)
	{
		CartItem cartItem=cartDAO.getCartItem(cartItemId);
		cartItem.setPstatus("P");
		cartDAO.updateCartItem(cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<CartItem> listCartItems=cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItems",cartDAO.retrieveCartItemsPaid(username));
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(listCartItems));
		m.addAttribute("cartItem",cartItem);
		
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItemsPaid(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		return "PaidStatus";
	}
	
	@RequestMapping(value="/CheckOut")
	public String CheckOut(@ModelAttribute("cartItem")CartItem cartItem,HttpSession session,Model m)
	{
		String username=(String)session.getAttribute("username");
		
		m.addAttribute("cartItem",cartItem);
		
		List<CartItem> cartItemList=cartDAO.retrieveCartItemsPaid(username);
		m.addAttribute("cartItemList",cartItemList);
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		
		m.addAttribute("cartItems",cartDAO.retrieveCartItemsPaid(username));
		m.addAttribute("grandTotalPrice",this.calcGrandTotalValue(cartItemList));
		
		return "OrderDetail";
	}
	
		public LinkedHashMap<Integer,String> getCartItemList(List<CartItem> CartItemlist)
		{
			LinkedHashMap<Integer,String> cartItemData=new LinkedHashMap<Integer,String>();
		
			int count=0;
			while(count<CartItemlist.size())
			{
				cartItemData.put(CartItemlist.get(count).getCartItemId(),CartItemlist.get(count).getUsername());
				count++;
			}
			return cartItemData;
		}
}