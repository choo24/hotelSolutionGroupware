package com.hotelsolution.fire.member.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.hotelsolution.fire.mail.send.MailSendService;
import com.hotelsolution.fire.member.service.MemberService;
import com.hotelsolution.fire.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Service
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService service;
	private final MailSendService mailSendService;
	
	//회원가입(화면)
	@GetMapping("join")
	public void join() {
		
	}
	
	//회원가입
	@PostMapping("join")
	public String join(MemberVo vo ,HttpServletRequest req
			,@RequestParam("file") MultipartFile image
			) {
		
		log.info(vo.toString());
		
		try {
			String savePath = req.getServletContext().getRealPath("/resources/img/member/profile/");
			
			if(!image.isEmpty()) {
				log.info(savePath);
				String originName = image.getOriginalFilename();
				vo.setImage(originName);
				String randomName = UUID.randomUUID().toString();
				String ext = originName.substring(originName.lastIndexOf("."));
				String changeName = randomName+ext;
				vo.setChangeImage(changeName);
				String path = savePath + changeName;
				File target = new File(path);
				image.transferTo(target);
			}
			
			int result = service.join(vo);
			
			if(result != 1) {
				throw new RuntimeException("회원가입 실패");
			}
			
			return "redirect:/member/login";
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("회원가입 실패");
		}
		
	}//join
	
	//로그인(화면)
	@GetMapping("login")
	public void login() {
		
	}
	
	//로그인
	@PostMapping("login")
	@ResponseBody
	public String login(MemberVo vo , HttpSession session , Model model){
		
		MemberVo loginMember = service.login(vo);
		log.info("로그인멤버 : {}" , loginMember);
		//List<MemberVo> members = service.getAllMembers(vo);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			//session.setAttribute("members", members);
			return "success";
			
		}else {
			return "fail";
		}
		
		
		
	}//login
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/member/login";
		
	}
	
	//비밀번호 이메일 인증(화면)
	@GetMapping("emailAuthentication")
	public void emailAuthentication() {
		
		
	}
	
	//비밀번호 이메일 인증
	@PostMapping("emailAuthentication")
	@ResponseBody
	public String emailAuthentication(MemberVo vo , HttpSession session) throws Exception {
		
		boolean emailCheck = service.emailAuthenTication(vo);
		log.info("메일 일치 여부 : {}" , emailCheck);
		
		if(!emailCheck) {
			return "fail";
		}
		
		return "success";
		
	}
	
	//메일 보내고 멤버테이블에 인증번호 업데이트
	@PostMapping("emailAuthentication.wow")
	public String mailAuth(@RequestParam("email") String email ,HttpSession session) throws Exception {

		String authKey = mailSendService.sendAuthMail(email);
		
		int result = service.updateMailKey(email , authKey);
		if(result != 1) {
			throw new RuntimeException("인증키 업데이트 에러");
		}
		
		return authKey;
	}
	
	//메일로 받은 인증번호가 맞는지 아닌지 판단
	@PostMapping("emailKeyRightOrNo")
	@ResponseBody
	public String emailKeyRightOrNo(@RequestParam("email") String email 
								  , @RequestParam("code") String code) {
		
		String getCode = service.emailKeyRightOrNo(email);
		log.info("email : {} " , email);
		log.info("code : {} " , code);
		
		if(!getCode.equals(code)) {
			return "fail";
		}
		return "success";
		
	}
	
	
	
	//비밀번호 재설정(화면)
	@GetMapping("passwordReset")
	public void passwordReset() {
		
	}
	
	//비밀번호 재설정
	@PostMapping("passwordReset")
	public String passwordReset(@RequestParam("password") String password 
							  , @RequestParam("passwordAgain") String passwordAgain
							  , String email) {
		
		int result = service.passwordReset(password , email);
		
		log.info(Integer.toString(result));
		
		if(result != 1) {
			throw new RuntimeException("비밀번호 변경 오류");
		}
		
		return "redirect:/member/login";
		
	}//passwordReset
	
	//모든 구성원 가져오기
	


	
}
