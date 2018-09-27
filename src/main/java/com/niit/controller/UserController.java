package com.niit.controller;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.UserDAO;
import com.niit.model.User;
import com.niit.controller.ProductController;

@Controller
public class UserController 
{	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired 
	CategoryDAO categoryDAO;
	
	@Autowired
	UserDAO userDAO;
	
	boolean flag=true;
	
	@RequestMapping(value="/login_success")
	public String loginProcess(HttpSession session,Model m)
	{
		String page=null;
		boolean loggedIn=true;
		
		SecurityContext securitycontext=SecurityContextHolder.getContext(); 
		Authentication authentication=securitycontext.getAuthentication();
		
		String username=authentication.getName();
		
		Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role:roles)
		{
			String roleName=role.getAuthority();
			session.setAttribute("loggedIn",loggedIn);
			session.setAttribute("username",username);
			session.setAttribute("role",roleName);
			
			if(roleName.equals("ROLE_USER"))
			{
				page="UserHome";
			}
			else
			{	
				page="AdminHome";
			}
		}
		
		return page;
	}

	@RequestMapping("/perform_logout")
	public String loggingOut(HttpSession session,Model m)
	{
		session.invalidate();
		m.addAttribute("errorInfo","Successfully Logged Out");
		return "Login";		
	}
	
	
	@RequestMapping(value="/User")
	public String showManageUser(Model m)
	{
		User user=new User();
		m.addAttribute("user",user);
		
		List<User> userList=userDAO.listUser();
		m.addAttribute("userList",userList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "User";
	}
	
	
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user")User user,Model m)
	{
		user.setRole("ROLE_USER");
		user.setEnabled(true);
		
		userDAO.addUser(user);
		
		User user1=new User();
		m.addAttribute("user",user1);

		flag=true;
		m.addAttribute("flag",flag);
		
		return "Login";
	}
	
	@RequestMapping(value="/addUserAdmin",method=RequestMethod.POST)
	public String addUserAdmin(@ModelAttribute("user")User user,Model m)
	{
		userDAO.addUser(user);
		
		User user1=new User();
		m.addAttribute("user",user1);

		List<User> userList=userDAO.listUser();
		m.addAttribute("userList",userList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "User";
	}
	
	@RequestMapping(value="/UpdateUser/{userId}",method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user")User user,Model m)
	{
		userDAO.editUser(user);
		
		User user1=new User();
		m.addAttribute("user",user1);

		List<User> userList=userDAO.listUser();
		m.addAttribute("userList",userList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "User";
	}
	
	@RequestMapping(value="/deleteUser/{userId}",method=RequestMethod.GET)
	public String deleteUser(@PathVariable("userId")int userId,Model m)
	{
		User user=userDAO.getUser(userId);
		
		userDAO.deleteUser(user);
		
		User user1=new User();
		m.addAttribute("user",user1);
		
		List<User> userList=userDAO.listUser();
		m.addAttribute("userList",userList);
		
		flag=true;
		m.addAttribute("flag",flag);
		
		return "User";
	}
	
	
	@RequestMapping(value="/editUser/{userId}",method=RequestMethod.GET)
	public String editUser(@PathVariable("userId")int userId,Model m)
	{	
		User user=userDAO.getUser(userId);
				
		m.addAttribute("user",user);
		
		List<User> userList=userDAO.listUser();
		m.addAttribute("userList",userList);
		
		flag=false;
		m.addAttribute("flag",flag);
		
		return "User";
	}

	
	public LinkedHashMap<Integer,String> getUserList(List<User> listUser)
	{
		LinkedHashMap<Integer,String> userData=new LinkedHashMap<Integer,String>();
		
		int count=0;
		while(count<listUser.size())
		{
			userData.put(listUser.get(count).getUserId(),listUser.get(count).getUsername());
			count++;
		}
		return userData;
	}
}