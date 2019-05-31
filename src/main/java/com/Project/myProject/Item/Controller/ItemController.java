package com.Project.myProject.Item.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Project.myProject.Item.VO.primaryVO;


public interface ItemController {
public ModelAndView ItemAdd(@RequestParam("primaryVO") primaryVO vo,HttpServletRequest request,HttpServletResponse response) throws Exception;
public ModelAndView ItemDelete(@RequestParam("id") String id,HttpServletRequest request,HttpServletResponse response) throws Exception;
public ModelAndView ItemUpdate(@RequestParam("id") String id,HttpServletRequest request,HttpServletResponse response) throws Exception;
public ModelAndView ItemSelect(HttpServletRequest request,HttpServletResponse response) throws Exception;
public ModelAndView SearchAgency() throws Exception;
public ResponseEntity<String> AddItem(primaryVO vo,HttpServletResponse response,HttpServletRequest request) throws Exception;
}
