package com.hotelsolution.fire.approval.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hotelsolution.fire.approval.service.ApprovalService;
import com.hotelsolution.fire.approval.vo.ApprovalReferrerVo;
import com.hotelsolution.fire.approval.vo.ApprovalVo;
import com.hotelsolution.fire.approval.vo.ApproverVo;
import com.hotelsolution.fire.approval.vo.DocumentVo;
import com.hotelsolution.fire.approval.vo.ExpenditureVo;
import com.hotelsolution.fire.approval.vo.ItemVo;
import com.hotelsolution.fire.approval.vo.PositionVo;
import com.hotelsolution.fire.approval.vo.TeamVo;
import com.hotelsolution.fire.approval.vo.VactionVo;
import com.hotelsolution.fire.common.page.vo.PageVo;
import com.hotelsolution.fire.member.vo.MemberVo;
import com.hotelsolution.fire.temp.FireConstPool;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
@Slf4j
public class ApprovalController {
	
	private final ApprovalService service;

	//결재 첫화면
	@GetMapping("approvalFirstPage")
	public String approval(@RequestParam(defaultValue = "1") int p ,  Model model , HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int listCount = service.getApprovalFirstPageCnt(no);
		int currentPage = p;
		int pageLimit = FireConstPool.COMPANY_BOARD_PAGE_LIMIT;
		int boardLimit = 7;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("pv", pv);
		
		
		List<ApprovalVo> approvalList = service.getApproval(map);
		System.out.println(approvalList);
		model.addAttribute("approvalList" ,approvalList);
		
		return "approval/approvalFirstPage";
	}
	
	//내가받은결재(화면)
	@GetMapping("getApproval")
	public String getApproval(@RequestParam(defaultValue = "1") int p , Model model , HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int listCount = service.getApprovalCnt(no);
		int currentPage = p;
		int pageLimit = FireConstPool.COMPANY_BOARD_PAGE_LIMIT;
		int boardLimit = 7;
		
		PageVo pv = new PageVo(listCount, currentPage , pageLimit , boardLimit);
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("pv", pv);
		
		
		List<ApprovalVo> getList = service.getMyApproval(map);
		System.out.println("getList : " + getList );
		model.addAttribute("getList" , getList);
		
		return "approval/getApproval";
		
	}
	
	//참조받은결재(화면)
	@GetMapping("referrerApproval")
	public String referrerApproval(@RequestParam(defaultValue = "1") int p , Model model ,  HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int listCount = service.getReferrCnt(no);
		int currentPage = p;
		int pageLimit = FireConstPool.COMPANY_BOARD_PAGE_LIMIT;
		int boardLimit = 7;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("pv", pv);
		
		List<ApprovalVo> getList = service.getReferenceApproval(map);
		System.out.println("refgetList :" + getList);
		model.addAttribute("getList" , getList);
		
		return "approval/referrerApproval";
		
	}
	
	
	//웹페이지가 로드되었을때 ApprovalDocument 인서트
	@PostMapping("insertApprovalDocument")
	@ResponseBody
	public String insertApprovalDocument(Model model , ApprovalVo avo) {
		
		int result = service.insertApprovalDocument(avo);
		if(result != 1) {
			return "fail";
		}
			return "success";
			
//		
	}
	
	
	//휴가신청서 작성(화면)
	@GetMapping("vaction")
	public void vaction(Model model , String documentTypeNo , String documentTypeName , HttpSession session) {
		
		Map<String, String> map = new HashMap<>();
		map.put("documentTypeNo", documentTypeNo);
		map.put("documentTypeName", documentTypeName);
		
		DocumentVo documentType = service.getDocumentVactionNo(map);
		
		session.setAttribute("documentType", documentType);
		//model.addAttribute("documentType", documentType);
		
		List<PositionVo> positionList = service.getPositionList();

		List<TeamVo> teamList = service.getTeamList();
		
		Map<String, String> params = new HashMap<>();
//		params.put("name", name);
//		params.put("positionName", positionName);
//		params.put("teamName", teamName);
//		params.put("approvalPower", approvalPower);
		
		List<MemberVo> list = service.getDecideEmployee(params);
		
		model.addAttribute("list" , list);
		System.out.println("list : " + list);
		model.addAttribute("positionList" , positionList);
		model.addAttribute("teamList" , teamList);
	}
	
	//휴가신청서 작성
	@PostMapping("vacation")
	public String vaction(VactionVo vo , ApprovalVo avo , String teamLeader , String hrTeamLeader ,  
			@RequestParam("reference") List<String> referenceList , HttpSession session) {
		
		System.out.println(referenceList);
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int result = service.insertApprovalDocument(avo);

		ApprovalVo appvo = service.getDocumentNo(no);
		String avoNo = appvo.getNo();
		vo.setAppNo(avoNo);
		System.out.println(vo);
		int result2 = service.vacation(vo);
		
		
		int startIndex = 0;
		int endIndex = 0;
		
		ApproverVo appVo = new ApproverVo();
		startIndex = teamLeader.indexOf("[")+1;
		endIndex = teamLeader.indexOf("]");
		String tlNo = teamLeader.substring(startIndex , endIndex);
		System.out.println(tlNo);
		List<String> approverList = new ArrayList<String>();
		approverList.add(tlNo);
		approverList.add(hrTeamLeader);
		
		int x = 0;
		int result3 =0;
		for(int i=0; i < approverList.size(); i++) {
			appVo.setApprovalDocNo(avoNo);
			appVo.setStatusNo("1");
			appVo.setAppNo(approverList.get(i));
			x = i+1;
			String p = Integer.toString(x);
			appVo.setPriority(p);
			result3 = service.approver(appVo);
			System.out.println("@@@#!@#!@#!"+result3);
		}
		
		int result4 = 0;
		ApprovalReferrerVo arvo = new ApprovalReferrerVo();
		for(String reference : referenceList) {
			startIndex = reference.indexOf("[")+1;
			endIndex = reference.indexOf("]");
			
			String rfNo = reference.substring(startIndex , endIndex);
			
			arvo.setApprovalNo(avoNo);
			arvo.setReferrerNo(rfNo);
			
			result4 = service.referrer(arvo);
		}
		
		if(result ==1 && result2 == 1 && result3 == 1 && result4 == 1) {
			return "redirect:/approval/approvalFirstPage";
		}
		
		throw new RuntimeException();
		
	}
	
	//지출결의서 작성(화면)
	@GetMapping("expenditure")
	public String expenditure(HttpSession session , Model model , String documentTypeNo , String documentTypeName) {
		Map<String, String> map = new HashMap<>();
		map.put("documentTypeNo", documentTypeNo);
		map.put("documentTypeName", documentTypeName);
		
		DocumentVo documentType = service.getDocumentExpenditureNo(map);
		
		List<PositionVo> positionList = service.getPositionList();

		List<TeamVo> teamList = service.getTeamList();
		
		Map<String, String> params = new HashMap<>();
//		params.put("name", name);
//		params.put("positionName", positionName);
//		params.put("teamName", teamName);
//		params.put("approvalPower", approvalPower);
		
		List<MemberVo> list = service.getDecideEmployee(params);
		
		model.addAttribute("list" , list);
		model.addAttribute("positionList" , positionList);
		model.addAttribute("teamList" , teamList);
		
		List<ItemVo> itemList = service.getItemList();
		System.out.println("itemsList : " +itemList);
		
		model.addAttribute("itemList" , itemList);
		session.setAttribute("documentType", documentType);
		
		return "approval/expenditure";
		
	}
	
	//지출결의서 작성
	@PostMapping("expenditure")
	public String expenditure(HttpSession session , String title
			,ExpenditureVo evo , @RequestParam("item") List<String> itemList , @RequestParam("count") List<String> countList) {
		System.out.println("item : " + itemList);
		System.out.println("count : " + countList);
		
		itemList.removeIf(element -> element == null || element.trim().isEmpty());
		System.out.println(itemList);
		
		countList.removeIf(element -> element == null || element.trim().isEmpty());
		System.out.println(countList);
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		ApprovalVo avo = service.getDocumentNo(no);
		String avoNo = avo.getNo();
		System.out.println(avoNo);
		
		Map<String, String> map = new HashMap<>();
		map.put("avoNo", avoNo);
		map.put("title", title);
		System.out.println(map);
		int result = service.updateDocumentExpenditure(map);
		
		Map<String, Object> params = new HashMap<>();
		params.put("avoNo", avoNo);
		params.put("totalPrice", evo.getTotalPrice());
		int result2 = service.expenditure(params);
		
		ExpenditureVo Evo = service.getExpenditureNo(avoNo);
		String keyNo = Evo.getNo();
		
		Map<String, Object> paramValue = new HashMap<>();
		paramValue.put("keyNo", keyNo);
		paramValue.put("count", countList);
		paramValue.put("item", itemList);
		int result3 = service.expenditureItemList(paramValue);
		
		if(result != 1 && result2 != 1 && result3 != 1) {
			throw new RuntimeException();
		}
		
	
		return "redirect:/approval/approvalFirstPage";
	}
	
	//업무보고서 작성(화면)
	@GetMapping("report")
	public void report(Model model , HttpSession session, String documentTypeNo , String documentTypeName) {
		Map<String, String> map = new HashMap<>();
		map.put("documentTypeNo", documentTypeNo);
		map.put("documentTypeName", documentTypeName);
		
		DocumentVo documentType = service.getDocumentReportNo(map);
		
		System.out.println("@@@"+documentType);
		
		session.setAttribute("documentType", documentType);
//		model.addAttribute("documentType" , documentType);
		
		List<PositionVo> positionList = service.getPositionList();

		List<TeamVo> teamList = service.getTeamList();
		
		Map<String, String> params = new HashMap<>();
//		params.put("name", name);
//		params.put("positionName", positionName);
//		params.put("teamName", teamName);
//		params.put("approvalPower", approvalPower);
		
		List<MemberVo> list = service.getDecideEmployee(params);
		
		model.addAttribute("list" , list);
		model.addAttribute("positionList" , positionList);
		model.addAttribute("teamList" , teamList);
		
	}
	
	//업무보고서 작성
	@PostMapping("report")
	public String report(HttpSession session ,String title , String content , String completed , String suggestions) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		ApprovalVo avo = service.getDocumentNo(no);
		String avoNo = avo.getNo();
		System.out.println(avoNo);
		
		Map<String, String> map = new HashMap<>();
		map.put("avoNo", avoNo);
		map.put("content", content);
		map.put("title", title);
		System.out.println(map);
		
		Map<String,String> params = new HashMap<>();
		params.put("avoNo", avoNo);
		params.put("completed", completed);
		params.put("suggestions", suggestions);
		
		int result = service.updateDocumentReport(map);
		int result2 = service.report(params);
		
		if(result != 1 && result2 != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/approval/approvalFirstPage";
	}
	
	
	//휴가신청서 상세조회(화면)
	@GetMapping("vactionDetail")
	public String vactionDetail(String no , Model model) {

		ApprovalVo vo = service.vacationDetail(no);
		List<ApproverVo> list = service.getApprover(no);
		
		List<ApprovalReferrerVo> fList = service.getReferrer(no);
		
		model.addAttribute("vo" , vo);
		model.addAttribute("list" , list);
		model.addAttribute("fList" , fList);
		
		System.out.println("vo : " + vo);
		System.out.println("appList : " + list);
		System.out.println("refList : " + fList);
		
		return "approval/vactionDetail";
	}
	
	//업무보고서 상세조회(화면)
	@GetMapping("reportDetail")
	public void reportDetail() {
		
	}
	
	//지출결의서 상세조회(화면)
	@GetMapping("expenditureDetail")
	public void expenditureDetail() {
		
	}
	
	//결재선 정하기(화면)
	@GetMapping("approvalLine")
	public void approvalLine(Model model ,String name , String approvalPower , String positionName , String teamName) {
		
	List<PositionVo> positionList = service.getPositionList();

	List<TeamVo> teamList = service.getTeamList();
	
//	Map<String, String> map = new HashMap<>();
//	map.put("documentTypeNo", documentTypeNo);
//	map.put("documentTypeName", documentTypeName);
//	
//	List<DocumentVo> voList = service.getDocumentType(map);
	
	Map<String, String> params = new HashMap<>();
	params.put("name", name);
	params.put("positionName", positionName);
	params.put("teamName", teamName);
	params.put("approvalPower", approvalPower);
	System.out.println(params);
	List<MemberVo> list = service.getDecideEmployee(params);
	
	//model.addAttribute("voList" , voList);
	model.addAttribute("list" , list);
	System.out.println(list);
	model.addAttribute("positionList" , positionList);
	model.addAttribute("teamList" , teamList);
	
		
	}
	
	
	@GetMapping("getEmployee")
	@ResponseBody
	//사원 가져오기
	public String getEmployee(String teamNo , String positionNo , String positionName , String teamName) {
		
		Map<String, String> map = new HashMap<>();
		map.put("teamNo", teamNo);
		map.put("positionNo", positionNo);
		map.put("positionName", positionName);
		map.put("teamName", teamName);
		
		System.out.println(map);
		
		List<MemberVo> voList = service.getEmployee(map);
		System.out.println(voList);
		Gson gson = new Gson();
		
		return gson.toJson(voList);
	
	}
	
	
	
	
}//class








