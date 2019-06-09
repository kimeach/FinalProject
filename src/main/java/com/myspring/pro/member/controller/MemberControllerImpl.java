package com.myspring.pro.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro.member.service.MemberService;
import com.myspring.pro.member.vo.MemberVO;




@Controller("memberController")
@EnableAspectJAutoProxy
public class MemberControllerImpl   implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO ;
	
	//회원리스트 조회
	@Override
	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
 @RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = memberService.addMember(memberVO);
		return new ModelAndView("redirect:/member/listMembers.do");
	}
	@Override
	@RequestMapping(value="/member/removeMember.do", method=RequestMethod.GET)
	public ModelAndView removeMember(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		memberService.removeMember(id);
		return new ModelAndView("redirect:/member/listMembers.do");
	}
	@Override
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView login(MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
	    MemberVO memberVO = memberService.login(member);
	    if(member!=null) {
	    	 HttpSession session = request.getSession();
	    	 session.setAttribute("member", memberVO);
	    	 session.setAttribute("isLogOn", true);
	    	 String action=(String)session.getAttribute("action");
	    	 System.out.println("session-action---------"+action);
	    	 session.removeAttribute("action");
	    	 if(action!=null) {
	    		 mav.setViewName("redirect:"+action);
	    	 }else {
	    		 mav.setViewName("redirect:/member/listMembers.do");
	    	 }
	    }else {
	    	rAttr.addAttribute("result", "loginFailed");
	    	mav.setViewName("redirect:/member/loginForm.do");
	    }
		return mav;
	}
	@Override
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		 session.removeAttribute("member");
    	 session.removeAttribute("isLogOn");
		return new ModelAndView("redirect:/member/listMembers.do");
	}
	
	@Override
	@RequestMapping(value="/member/*Form.do",method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String action=(String)request.getParameter("action");
		String parentNO=(String)request.getParameter("parentNO");

		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		session.setAttribute("parentNO", parentNO);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/modMemberForm.do",method=RequestMethod.GET)
	public ModelAndView modMemberForm(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		MemberVO member = memberService.getMemberById(id);
		mav.addObject("memberVO", member);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/modMember.do",method=RequestMethod.POST)
	public ModelAndView modMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = memberService.modMember(memberVO);
		return new ModelAndView("redirect:/member/listMembers.do");
	}
	
}
