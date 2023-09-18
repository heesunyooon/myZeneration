package com.project.MyZeneration_spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.MyZeneration_spring.service.CoreService;
import com.project.MyZeneration_spring.service.Standard;
import com.project.MyZeneration_spring.vo.ItemsVO;
import com.project.MyZeneration_spring.vo.NestedSelectionVO;

@Controller
@RequestMapping(value = "/core")
public class CoreServiceController {

	@Autowired
	CoreService coreService;

	Standard standard;

	/*
	 * 나의 만족도 예측 서비스, MZ세대 만족도 분석서비스 컨트롤러 
	 */
	
	//나의 만족도 예측 서비스화면 띄우기  / 테이블 부분 회원정보 불러오기  / 각 select의 option 목록 
	@GetMapping("/analysisMySat")
	public String analysisMySat(@RequestParam(value = "memberId") String memberId, Model model, HttpSession session) {
		System.out.println("[Notice] CoreServiceController (analysisMySat)");
		model.addAttribute("memberInfo", coreService.getMemberInfo(memberId, session));
		model.addAttribute("educationList", Standard.EDUCATIONLIST);
		model.addAttribute("majorList", Standard.MAJORLIST);
		model.addAttribute("regionList", Standard.REGIONLIST);
		model.addAttribute("salaryList", Standard.SALARYLIST);
		model.addAttribute("familyNoList", Standard.FAMILYNOLIST);
		model.addAttribute("residenceList", Standard.RESIDENCELIST);
		model.addAttribute("workingHourList", Standard.WORKINGHOURLIST);
		model.addAttribute("marriageList", Standard.MARRIAGELIST);
		session.setAttribute("lifeScore", coreService.getMemberInfo(memberId, session).getLifeScore());
		return "analysisMySat";
	}

	//나의 만족도 예측 서비스 - ajax로 레이더차트 데이터 내보내기
	@PostMapping("/updateRadarChart")
	public @ResponseBody List<List<String>> updateRadarChart(@RequestBody ItemsVO items) {
		System.out.println("[Notice] CoreServiceController (updateRadarChart)");
		return coreService.calculateRatio(items);
	}

	//나의 만족도 예측 서비스- ajax로 바차트 데이터 내보내기
	@PostMapping("/updateBarChart")
	public @ResponseBody List<List<String>> updateBarChart(@RequestBody ItemsVO items, HttpSession session) {
		System.out.println("[Notice] CoreServiceController (updateBarChart)");
		return coreService.recommend(items, session);
	}

	//나의 만족도 예측 서비스 - option select 값 변경에 따라 나의 만족도 데이터 내보내기
	@PostMapping("/updateMySatScore")
	public @ResponseBody int updateMySatScore(@RequestBody ItemsVO items, HttpSession session) {
		System.out.println("[Notice] CoreServiceController (updateMySatScore)");
		int result = coreService.updateMySatScore(items, (String) session.getAttribute("memberId"), session);
		return result;
	}
	
	//MZ세대 만족도 화면 띄우기
	@GetMapping("/analysisMz")
	public String analysisMz() {
		System.out.println("[Notice] CoreServiceController (analysisMz)");
		return "analysisMz";
	}

	//MZ세대 만족도 분석 서비스 - ajax로 도넛차트 데이터 내보내기
	@PostMapping("/updateDoughnutChart")
	public @ResponseBody List<List<String>> updateDoughnutChart(@RequestBody NestedSelectionVO lists) {
		System.out.println("[Notice] CoreServiceController (updateDoughnutChart)");
		return coreService.getMzRatio(lists);
	}

	
}
