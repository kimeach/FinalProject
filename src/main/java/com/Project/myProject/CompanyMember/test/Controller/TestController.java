package com.Project.myProject.CompanyMember.test.Controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.Project.myProject.CompanyMember.test.Service.TestService;
@RestController
@RequestMapping("/test/")
public class TestController {
@Autowired
TestService TestService;
	@RequestMapping(value="testMain",method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("pg", "1");
		return mav;
	}
	@RequestMapping(value="/{pg}",method=RequestMethod.DELETE)
	public ResponseEntity<String> del(@PathVariable("pg") int pg){
		HttpHeaders http = new HttpHeaders();
		http.add("Content-type", "text/html; charset=utf-8");
		String message="삭제되었습니다.";
		return new ResponseEntity<String>(message,http,HttpStatus.BAD_REQUEST);	
	}
	@RequestMapping(value="/tx",method = RequestMethod.GET)
	public @ResponseBody String adss() {
		return "hi";	
	}
	@RequestMapping("/tst")
	@ResponseBody
	public ModelAndView mass(@RequestBody int vals) {
		return new ModelAndView();
	}
	@RequestMapping("/testVal")
	public ModelAndView ass(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
			System.out.println(viewName);
			
			
			
		return new ModelAndView(viewName);
	}
	@RequestMapping(value="/testValResult",method= {RequestMethod.POST,RequestMethod.GET},produces = "application/text; charset=utf-8")
	public @ResponseBody String aad(@RequestParam("keyword") String keyword,HttpServletRequest request,
									HttpServletResponse response){
		System.out.println(keyword);
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if(keyword == null || keyword.equals(""))
			return null;
		keyword = keyword.toUpperCase();
		return keyword;
	}
	
}

