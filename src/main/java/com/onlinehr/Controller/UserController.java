package com.onlinehr.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onlinehr.domain.Education;
import com.onlinehr.domain.JobExperience;
import com.onlinehr.domain.PersonalUser;
import com.onlinehr.domain.Resume;
import com.onlinehr.domain.UserLogin;
import com.onlinehr.domain.UserRole;
import com.onlinehr.service.IResumeService;
import com.onlinehr.service.IUserService;

/**
 * 个人用户
 * 
 *
 */
@Controller
@RequestMapping(value="user")
public class UserController {

	@Autowired
	@Qualifier(value="userService")
	private IUserService userService;
	
	@Autowired
	@Qualifier(value="resumeService")
	private IResumeService resumeService;
	
	@Value("user/user_register")			//注册页
	private String userRegisterPage;
	
	@Value("user/user_basic_info")		//填写基本信息页
	private String userBasicInfoPage;
	
	@Value("/user/user_study_experience")	//填写教育经历与工作经历页
	private String userStudyExperiencePage;
	
	@Value("/user/user_resume_preview")	//简历预览页
	private String userResumePreviewPage;
	
	@Value("/user/user_main")
	private String userMainPage;			//简历列表页
	
	@Value("error")
	private String errorPage;					//错误页面
	
	/**
	 * 用户注册页
	 * @return
	 */
	@RequestMapping(value="/registerpage.html")
	public String toRegisterPage(){
		return this.userRegisterPage;
	}
	
	/**
	 * 个人用户注册(登录信息)
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/register.html")
	public String userRegister(HttpServletRequest request, ModelMap modelMap){
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		UserLogin userLogin = new UserLogin();
		userLogin.setUserAccount(account);
		userLogin.setUsrePass(password);
		userLogin.setUserStatu(1);
		
		UserRole userRole = new UserRole();
		userRole.setRoleId(1);
		userLogin.setUserRole(userRole);
		
		this.userService.userRegister(userLogin);
		
		//将用户信息放入session中
		HttpSession session = request.getSession();
		session.setAttribute("userLogin", userLogin);
		
		return this.userBasicInfoPage;
	}

	/**
	 * 个人用户登录
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/userlogin", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request, UserLogin userLogin, ModelMap modelMap){
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
			
			//取当前用户所有简历信息
			List<Resume> resumeList = resumeService.getResumesByAccount(userLogin.getUserAccount());
			
			modelMap.addAttribute("resumeList", resumeList);
			
			if(resumeList != null && resumeList.size() > 0){//用户已注册简历
				return this.userMainPage;
			}else{
				return this.userBasicInfoPage;
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
	public String inputBasicInfo(HttpServletRequest request,PersonalUser personalUser, ModelMap modelMap, @RequestParam("userPhoto") MultipartFile userPhoto){
		HttpSession session = request.getSession();
		UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");
		
		if(userLogin != null){

			//头像信息
			String realPath = request.getSession().getServletContext().getRealPath("");//取物理路径
			if(!userPhoto.isEmpty()){//不为空
				try {
					userPhoto.transferTo(new File(realPath+"/photo/user/"+userPhoto.getOriginalFilename()));
					personalUser.setUserPhotoPath("/photo/user/"+userPhoto.getOriginalFilename());
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}else{
				personalUser.setUserPhotoPath("images/default_photo.png");
			}
			
			
			personalUser.setUserAccount(userLogin.getUserAccount());
			//保存个人基本信息
			userService.saveUserBasicInfo(personalUser);
		}
		
		//创建默认简历
		Resume defaultResume = new Resume();
		defaultResume.setPersonalUser(personalUser);
		defaultResume.setResumeName("默认简历");
		defaultResume.setStatus("1");
		
		Set<Resume> resumeSet = new HashSet<Resume>();
		resumeSet.add(defaultResume);
		personalUser.setResumeSet(resumeSet);
		session.setAttribute("personalUser", personalUser);
		
		
		resumeService.saveUserResume(defaultResume);
		
		
		return this.userStudyExperiencePage;
	}
	
	/**
	 * 取指定简历信息
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/getResume", method=RequestMethod.GET)
	public String getResumeById(HttpServletRequest request, ModelMap modelMap){
		String resumeId = request.getParameter("resumeId");
		
		Resume resultResume = resumeService.getResumeById(Integer.parseInt(resumeId));
		
		//取个人基本信息及默认简历信息
		modelMap.addAttribute("personalUser", resultResume.getPersonalUser());
		
		//教育经历信息
		modelMap.addAttribute("educations", resultResume.getEducations());
		
		//工作经历信息
		modelMap.addAttribute("jobExperiences", resultResume.getJobExps());
		
		return this.userResumePreviewPage;
	}
	
	/**
	 * 保存教育经历与工作经历信息
	 * @return
	 */
	@RequestMapping(value="/saveEduAndJobMess")
	public String saveEduAndJobMess(HttpServletRequest request, ModelMap modelMap){
		HttpSession session = request.getSession();
		PersonalUser personalUser = (PersonalUser) session.getAttribute("personalUser");
		
		//教育经历信息
		String eduStartYear = request.getParameter("eduStartYear");		//教育经历开始年份
		String eduStartMonth = request.getParameter("eduStartMonth");	//教育经历开始月份
		String eduendyear = request.getParameter("eduEndYear");			//教育经历结束年份
		String eduendmonth = request.getParameter("eduEndMonth");		//教育经历结束月份
		String schoolName = request.getParameter("schoolName");			//学校名称
		String specialtyId = request.getParameter("specialtyId"); 		//专业ID
		String degree = request.getParameter("degree");					//学历
		String speDesc = request.getParameter("speDesc");				//专业描述
		
		//工作经历信息
		String jobStartYear = request.getParameter("jobStartYear");		//工作经历开始年份
		String jobStartMonth = request.getParameter("jobStartMonth");	//工作经历开始月份
		String jobEndYear = request.getParameter("jobEndYear");			//工作经历结束年份
		String jobEndMonth = request.getParameter("jobEndMonth");		//工作经历结束月份
		String companyName = request.getParameter("companyName");		//公司名称
		String tradeId = request.getParameter("tradeId");				//行业ID
		String companyScale = request.getParameter("companyScale");		//公司规模
		String companyNature = request.getParameter("companyNature");	//公司性质
		String deparName = request.getParameter("deparName");			//部门名称
		String jodId = request.getParameter("jodId");					//职位ID
		String jobDesc = request.getParameter("jobDesc");				//职位描述
		
		Education education = new Education();
		education.setStartYear(eduStartYear);
		education.setStartMonth(eduStartMonth);
		education.setEndYear(eduendyear);
		education.setEndMonth(eduendmonth);
		education.setSchoolName(schoolName);
		education.setSpecialtyId(specialtyId);
		education.setDegree(degree);
		education.setSpeDesc(speDesc);
		
		JobExperience jobExperience = new JobExperience();
		jobExperience.setStartYear(jobStartYear);
		jobExperience.setStartMonth(jobStartMonth);
		jobExperience.setEndYear(jobEndYear);
		jobExperience.setEndMonth(jobEndMonth);
		jobExperience.setCompanyName(companyName);
		jobExperience.setTradeId(tradeId);
		jobExperience.setCompanyScale(companyScale);
		jobExperience.setCompanyNature(companyNature);
		jobExperience.setDeparName(deparName);
		jobExperience.setJodId(jodId);
		jobExperience.setJobDesc(jobDesc);
		
		Set<Resume> resumeSet = personalUser.getResumeSet();
		Resume resume = null;
		if(resumeSet != null && resumeSet.size() > 0){
			Iterator iterator = resumeSet.iterator();
			while (iterator.hasNext()) {
				resume = (Resume) iterator.next();
			}
			education.setResume(resume);
			jobExperience.setResume(resume);
			
			resumeService.saveUserEducation(education);		//保存教育经历信息
			resumeService.saveJobExpericnce(jobExperience);	//保存工作经历信息
		}
		
		//取个人基本信息及默认简历信息
		modelMap.addAttribute("personalUser", personalUser);
		
		Set<Education> educations = new HashSet<Education>();
		educations.add(education);
		
		//教育经历信息
		modelMap.addAttribute("educations", educations);
		
		Set<JobExperience> jobExperiences = new HashSet<JobExperience>();
		jobExperiences.add(jobExperience);
		
		//工作经历信息
		modelMap.addAttribute("jobExperiences", jobExperiences);
		
		return this.userResumePreviewPage;
	}
	
	/**
	 * 修改用户基本信息
	 * @param request
	 * @param personalUser
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/updateuserbasicinfo", method=RequestMethod.POST)
	public String updateUserBasicInfo(HttpServletRequest request, PersonalUser personalUser, ModelMap modelMap){
		this.userService.updateUserBasicInfo(personalUser);
		return "";
	}
	
	/**
	 * 检查用帐号是否已被占用
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/checkAccountIssue.html", method=RequestMethod.GET)
	@ResponseBody
	public String checkAccountIsUse(HttpServletRequest request, ModelMap modelMap){
		String account = request.getParameter("account") == null?"":request.getParameter("account");

        return Boolean.toString(this.userService.checkEmailIsUse(account));
	}
}
