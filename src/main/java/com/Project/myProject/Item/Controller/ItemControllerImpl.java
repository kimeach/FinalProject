package com.Project.myProject.Item.Controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.Project.myProject.Item.Service.ItemService;
import com.Project.myProject.Item.VO.primaryVO;
@RestController
@RequestMapping(value = "item/*")
public class ItemControllerImpl implements ItemController {
	@Autowired
	private ItemService ItemService;
	@Autowired
	private primaryVO primaryVO;
	//매물 조회
	@RequestMapping(value = "/ItemSelect.do", method = RequestMethod.GET)
	public ModelAndView index2(HttpServletRequest request, HttpServletResponse response,@RequestParam("authNum") String authNum) throws Exception {
	ModelAndView mav 	= new ModelAndView();
		/*
		 * if(request.getParameter("Itemselect") != null && request.getParameter("addr")
		 * != null && request.getParameter("minPrice") != null &&
		 * request.getParameter("maxPrice") != null) { ItemService.getSelectSearch();
		 * 
		 * }
		 */
	List<primaryVO> list = ItemService.ItemSelect(authNum);
	mav.addObject("list", list);
	String viewName = (String) request.getAttribute("viewName");
	System.out.println(viewName);
	mav.setViewName(viewName);
	return mav;
	}
	
	@Override
	public ModelAndView SearchAgency() throws Exception {
	return null;
	}
	@Override
	@RequestMapping(value = "/ItemInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	// 물품 등록 창
	public ModelAndView ItemAdd(primaryVO vo, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
	String viewName = (String) request.getAttribute("viewName");
	if (request.getParameter("value") != null) {
	if (request.getParameter("value").equals("before")) {
	ItemService.ItemAdd(vo);
	}
	} else {
	}
		return new ModelAndView(viewName);
	}
	@Override
	public ModelAndView ItemDelete(String id, HttpServletRequest request, HttpServletResponse response)
	throws Exception {
	// TODO Auto-generated method stub
	return null;
	}
	@Override
	@RequestMapping(value="/ItemUpdate.do",method=RequestMethod.GET)
	public ModelAndView ItemUpdate(HttpServletRequest request, HttpServletResponse response,@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum)
	throws Exception {
	String viewName= (String)request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);	
	return mav;
	}
	//등록 결과	
	@Override
	@RequestMapping(value="/ItemInsertResult.do",method=RequestMethod.POST)
	public ResponseEntity<String> AddItem(primaryVO vo,HttpServletResponse response,
											 HttpServletRequest request) throws Exception {
		HttpHeaders http = new HttpHeaders();
		http.add("Content-type", "text/html; charset=utf-8");
		int result = ItemService.ItemAdd(vo);
		String message ="<script>";
		if (result == 0) {
		message += "alert('가입에 실패 하였습니다.');";
		message += "location.href='./ItemInsert.do';";
		}
		else if(result !=0){
		message += "alert('가입에 성공 하였습니다.');";
		message += "location.href='../member/CompanyMemberView.do?pg=1';";
	}
		message += "</script>";
		return new ResponseEntity<String>(message,http,HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/ItemResult.do",method=RequestMethod.GET)
	public ResponseEntity<String> ItemDeleteAndUpdate(HttpServletRequest request,HttpServletResponse response,
													  @RequestParam("status") String status,@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum)
													  throws Exception{
		HttpHeaders http = new HttpHeaders();
		http.add("content-type","text/html; charset=utf-8");
		String message="<script>";
/*		if(status.equals("update")) {
		int result = ItemService.ItemUpdate(authNum,autoNum);
		if(result !=0) {
		message +="alert('수정되었습니다.');";
		message +="location.href='';";
		}
		else if(result ==0) {
		message +="alert('수정에 실패 하였습니다.');";
		message +="location.href='';";
		}
	}*/
	if(status.equals("delete")) {
	int result = ItemService.ItemDelete(authNum,autoNum);
	if(result != 0) {
	message +="alert('삭제 되었습니다.');";
	message +="location.href='./ItemSelect.do?authNum="+authNum+"'";
	}
	else if(result == 0) {
	message +="alert('삭제에 실패하였습니다.');";
	message +="history.go(-1);";
	}
	}
	message +="</script>";
	return new ResponseEntity<String>(message,http,HttpStatus.OK);
	}
	@Override
	@RequestMapping(value="/ItemView.do",method=RequestMethod.GET)
	public ModelAndView ItemView(@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum,HttpServletRequest request,HttpServletResponse response) throws Exception {
	String viewName = (String)request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);
	mav.addObject("list", ItemService.ItemViewSelect(authNum,autoNum));	
	return mav;
	}
}