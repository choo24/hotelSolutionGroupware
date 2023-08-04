package com.hotelsolution.fire.common.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.hotelsolution.fire.common.chat.service.ChatRoomService;
import com.hotelsolution.fire.common.chat.vo.ChatRoomVo;
import com.hotelsolution.fire.common.chat.vo.TeamChatMessageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.member.vo.PositionVo;
import com.hotelsolution.fire.member.vo.TeamVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("chat")
@Slf4j
public class ChatRoomController {
    private final ChatRoomService service;

    //채팅방 목록 조회
    @GetMapping("rooms")
    public void rooms(Model model,  HttpSession session){
    	List<TeamVo> tvo = service.getTvo();
    	List<PositionVo> pvo = 	service.getPvo();
    	System.out.println(tvo + " // " + pvo);
    	Gson gson = new Gson();
    	String pvoJson = gson.toJson(pvo);
    	
    	model.addAttribute("tvo",tvo);
    	model.addAttribute("pvo",pvoJson);
    
    }

//    //채팅방 개설
//    @PostMapping("room")
//    public String create(Model model, String no, HttpSession session, RedirectAttributes rttr){
//    	MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//        log.info("# Create Chat Room , name: " + loginMember);
//        Map<String,String>map = new HashMap<String, String>();
//        if(loginMember==null) {
//        	map.put("user1No", "1");//tempdata
//        }else {
//        	
//        	map.put("user1No", loginMember.getNo());//tempdata
//        }
//        map.put("user2No", no);//tempdata
//        
//        int result = service.createChatRoomVo(map);
//        if(result!=1) {
//        	throw new RuntimeException("채팅방 생성 실패");
//        }
//        ChatRoomVo roomName = service.getCreateChatRoomVo(map);
//        roomName.setUser1Name("1번");
//        roomName.setUser2Name("2번");
//        rttr.addFlashAttribute("roomName", roomName);
//        return "redirect:/chat/rooms";
//    }

  //전체채팅방 조회
    @GetMapping("hsroom")
    public void getRoom(Model model, HttpSession session ){
    	  MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    	  List<TeamChatMessageVo> voList = service.getHsChatList();
    	  System.out.println("hsroom get"+ voList);
    	  model.addAttribute("voList",voList);// 전체 채팅방 모든 메세지 조회
    	  
    }
    
    @PostMapping("hsroom")
    @ResponseBody
    public int getRoom(Model model, HttpSession session, @RequestBody Map<String, Object> jsonData) {
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        System.out.println("jsonData"+jsonData);
        String senderNo = loginMember.getNo();
        String content = (String) jsonData.get("content");
        String x = jsonData.get("senderNo").toString(); // senderNo를 문자열로 가져옴
        int dotIndex = x.indexOf(".");
        String postno = senderNo.substring(0, dotIndex);
        System.out.println(content+"dd"+"kk"+x+"xx"+"index : "+ dotIndex + "dd"+"postno" +postno);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(new Date()); // 현재 시간을 원하는 형식으로 변환
        Map<String, String> map = new HashMap<>();
        map.put("enrollDate", formattedDate);
        map.put("senderNo", senderNo);
        map.put("content", content);
       
        map.put("teamChatNo", "0");
        int result = 0;
        
        if(postno.equals(senderNo)) {
        	result = service.setHsChatList(map);
        }
        return result;
    }
    
    @GetMapping("troom")
    public void getTeamRoom(Model model, HttpSession session){
    	  MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");//로그인 사용자 정보
    	  String teamNo = loginMember.getTeamNo();
    	  List<TeamChatMessageVo> tvoList = service.getTeamChatList(teamNo);
    	  model.addAttribute("tvoList",tvoList);// 팀 채팅방 모든 메세지 조회
    }
    
    @PostMapping("troom")
    @ResponseBody
    public int getTeamRoom(Model model, HttpSession session, @RequestBody Map<String, Object> jsonData) {
        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        String senderNo = loginMember.getNo();
        String content = (String) jsonData.get("content");
        String postno = (String) jsonData.get("senderNo");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(new Date()); // 현재 시간을 원하는 형식으로 변환
        Map<String, String> map = new HashMap<>();
        map.put("enrollDate", formattedDate);
        map.put("senderNo", senderNo);
        map.put("content", content);
        map.put("teamChatNo", loginMember.getTeamNo());
        int result = 0;
        
        if(postno.equals(senderNo)) {
        	result = service.setHsChatList(map);
        }
        return result;
    }
  
}