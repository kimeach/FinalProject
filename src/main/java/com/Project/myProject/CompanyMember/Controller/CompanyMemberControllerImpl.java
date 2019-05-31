package com.Project.myProject.CompanyMember.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.myProject.CompanyMember.Service.CompanyMemberService;
import com.Project.myProject.CompanyMember.VO.CompanyMemberVO;
@Controller

  @RequestMapping("/member/*")
 public class CompanyMemberControllerImpl implements CompanyMemberController{
@Autowired
private CompanyMemberService CompanyMemberService;	
@Autowired
private CompanyMemberVO CompanyMemberVO; 

	  @Override
	  @RequestMapping(value="/CompanyMemberView.do",method ={RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView getallview(HttpServletResponse response, HttpServletRequest request) throws
	  Exception {
		 
	  String viewName = (String)request.getAttribute("viewName");
	  ModelAndView mav = new ModelAndView(viewName);
	  List<CompanyMemberVO> list = CompanyMemberService.SelectMember();
	  int count = list.size();
	  int page = 10;
	  int totalPage = (int)(Math.floor(count/page)+1);
	  System.out.println("리스트 갯수 : "+count);
	  System.out.println("페이지 수 : "+totalPage);
	  mav.addObject("list",list);
	  mav.addObject("pageNum", totalPage);
	  return mav;
	  }
	@RequestMapping("test.do")
	public ResponseEntity<String> ads() throws Exception{
		HttpHeaders http = new HttpHeaders();
		http.add("content-type", "text/html; charset=utf-8");
		
		String message = "<script>";
		message += "alert('하이');";
		message += "</script>";
		return new ResponseEntity<String>(message,http,HttpStatus.OK);
	}

}
