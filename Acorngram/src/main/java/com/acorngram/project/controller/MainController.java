package com.acorngram.project.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorngram.project.dto.UsersDto;
import com.acorngram.project.service.UsersService;

@Controller
public class MainController {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value="/users/signup.do", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute UsersDto dto, ModelAndView mView) {
		
		usersService.addUser(dto, mView);
		mView.setViewName("users/loginform");
		return mView;
	}
	
	@RequestMapping(value="/users/signin.do", method = RequestMethod.POST)
	public 	ModelAndView signIn(@ModelAttribute UsersDto dto, ModelAndView mView, HttpServletRequest request) {
		
		usersService.validUser(dto, mView, request.getSession());
		//원래 가려던 url 정보를 reqeust 에 담는다.
		String encodedUrl = URLEncoder.encode(request.getParameter("url"));
		request.setAttribute("encodedUrl", encodedUrl);
		mView.setViewName("home");
	
		return mView;	
	}
	
	@RequestMapping(value = "/users/updateUserInfo.do", method = RequestMethod.POST)
	public ModelAndView authUpdateUserInfo(@ModelAttribute UsersDto dto, ModelAndView mView, HttpServletRequest request) {
		//유저 정보 수정 하는 메소드 호출
		usersService.updateUser(dto, request);
		mView.setViewName("users_settings.do");
		return mView;
	}
	
	//profile image upload 요청처리 부분
		@RequestMapping("/users/profile_upload")
		@ResponseBody
		public Map<String, Object> authProfileUpload(HttpServletRequest request, @RequestParam MultipartFile ProfileImage){
			//서비스를 이용해서 프로파일 이미지를 저장하고 저장된 이미지 경로를 리턴 받는다
			String path = usersService.saveProfileImage(request, ProfileImage);
			//JSON 문자열 응답하기
			Map<String, Object> map = new HashMap<>();
			map.put("path", path);
			return map;
		}
	
	
	

}//UsersController END
