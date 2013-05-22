package com.onlinehr.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onlinehr.domain.CompanyUser;
import com.onlinehr.domain.UserLogin;
import com.onlinehr.domain.UserRole;
import com.onlinehr.service.ICompanyUserService;
import com.onlinehr.service.IUserService;

/**
 * 企业用户
 * @author TUYANWEI
 *
 */
@Controller
@RequestMapping(value="company")
public class CompanyController {

	@Autowired
	@Qualifier(value="userService")
	private IUserService userService;
	
	@Autowired
	@Qualifier(value="companyUserService")
	private ICompanyUserService companyUserService;
	
	@Value("/view/company/company_register")
	private String registerPage;				//企业用户注册
	
	@Value("/view/company/company_basic_info")
	private String companybasicpage;			//企业基本信息
	
	@Value("/view/company/company_main")
	private String companyMainPage;				//企业用户主页
	
	@Value("/view/error")
	private String errorPage;					//错误页面
	
	/**
	 * 企业用户注册页
	 * @return
	 */
	@RequestMapping(value="/registerpage")
	public String toRegisterPage(){
		return this.registerPage;
	}
	
	/**
	 * 企业用户注册(登录信息)
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/register")
	public String userRegister(HttpServletRequest request, ModelMap modelMap){
		String account = request.getParameter("companyAccount");
		String password = request.getParameter("companyPass");
		
		UserLogin userLogin = new UserLogin();
		userLogin.setUserAccount(account);
		userLogin.setUsrePass(password);
		userLogin.setUserStatu(1);
		
		UserRole userRole = new UserRole();
		userRole.setRoleId(2);
		userLogin.setUserRole(userRole);
		
		this.userService.userRegister(userLogin);
		
		//将用户信息放入session中
		HttpSession session = request.getSession();
		session.setAttribute("userLogin", userLogin);
		
		modelMap.addAttribute("companyAccount", account);
		return this.companybasicpage;
	}

	/**
	 * 企业用户登录
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/userlogin", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request,UserLogin userLogin, ModelMap modelMap){
		UserLogin resultUserLogin = userService.userLogin(userLogin);
		if(resultUserLogin == null){
			modelMap.addAttribute("errorMessage", "帐号或密码错误");
			return this.errorPage;
		}else if(resultUserLogin.getUserStatu() == 0){
			modelMap.addAttribute("errorMessage", "您的帐号已被锁定，请联系客服");
			return this.errorPage;
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("userLogin", userLogin);
			
			//判断企业用户信息是否已完善
			CompanyUser companyUser = this.companyUserService.getCompanyUserById(userLogin.getUserAccount());
			if(companyUser == null){
				return this.companybasicpage;
			}else{
				return this.companyMainPage;
			}
		}
	}
	
	
	/**
	 * 填写基本信息
	 * @param request
	 * @param personalUser
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/inputbasicinfo")
	public String inputBasicInfo(HttpServletRequest request,CompanyUser companyUser, ModelMap modelMap){
		//将企业用户信息保存到数据库
		this.companyUserService.saveCompanyUser(companyUser);
		
		return this.companyMainPage;
	}
	
}
