package com.project.MyZeneration_spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.MyZeneration_spring.service.MemberService;
import com.project.MyZeneration_spring.vo.MemberJoinVO;
import com.project.MyZeneration_spring.vo.SurveyVO;

/*
 * 회원관리 (회원가입, 로그인, 아이디찾기, 비밀번호 찾기), 로그인 컨트롤러
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	//로그인 화면 보여주기
	@GetMapping("/loginView")
	public String loginView() {
		System.out.println("[Notice] MemberController: (loginView)");
		return "loginView";
	}

	//로그인
	@PostMapping(value = "/login", produces = "text/html; charset=utf8")
	public @ResponseBody String login(@RequestParam String id, @RequestParam String password, HttpSession session) {
		boolean isMember = memberService.memberCheck(id, password);
		if (!isMember) {
			return "<script> alert('가입정보가 없습니다.'); location.href='/MyZeneration_spring/member/loginView'; </script>";
		}
		System.out.println("[Notice] MemberController: login.member");
		session.setAttribute("memberId", id);
		return "<script> location.href='/MyZeneration_spring/'; </script>";
	}

	//회원가입 화면 보여주기
	@GetMapping("/joinView")
	public String joinView() {
		System.out.println("[Notice] MemberController: (joinView)");
		return "joinView";
	}

	//회원가입
	@PostMapping(value = "/join", produces = "text/html; charset=utf8")
	public @ResponseBody String join(MemberJoinVO memberJoinVO, HttpSession session) {
		System.out.println("Membercontroller: join");

		int result = memberService.join(memberJoinVO, session);
		if (result == 0) {
			return "<script> location.href='/MyZeneration_spring/member/joinOk'; </script>";
		}
		if (result == 1) {
			return "<script> alert ('비밀번호가 같지않습니다.'); history.go(-1)</script>";
		} else if (result == 2) {
			return "<script> alert ('이미 사용중인 아이디입니다.'); history.go(-1)</script>";
		} else if (result == 3) {
			return "<script> alert ('이미 사용중인 이메일입니다.'); history.go(-1)</script>";
		} else
			return "<script> alert ('다시 시도해주세요.'); history.go(-1)</script>";
	}

	//회원가입 완료 화면 보여주기
	@GetMapping("/joinOk")
	public String joinOk() {
		return "joinOk";
	}

	//회원가입 아이디 중복체크
	@PostMapping(value = "/idCheck", produces = "text/html; charset=utf8")
	public @ResponseBody String idCheck(@RequestParam String id) {
		boolean hasId = memberService.hasId(id);
		if (hasId) {
			return "<script> alert ('이미 사용중인 아이디 입니다.'); history.go(-1)</script>";
		}
		return "<script> alert ('사용가능한 ID입니다.'); history.go(-1)</script>";

	}

	//개인정보 설문조사 화면 보여주기
	@GetMapping("/survey")
	public String survey() {
		return "survey";
	}

	//개인정보 설문조사 완료 화면 보여주기
	@PostMapping("/surveyComplete")
	public String inputSurveyData(SurveyVO surveyVO, HttpSession session) {
		String id = (String) session.getAttribute("memberId");
		memberService.inputSurveyData(surveyVO, id);
		return "surveyComplete";
	}

	//아이디 찾기 화면 보여주기
	@GetMapping("/idFindView")
	public String idFindView() {
		return "idFindView";
	}

	//아이디 찾기
	@PostMapping(value = "/idFind", produces = "text/html; charset=utf8")
	public @ResponseBody String idFind(@RequestParam String name, @RequestParam String eMail, HttpSession session)
			throws Exception {
		String result = memberService.idFind(name, eMail);

		if (result == null) {
			return "<script> alert('가입정보가 없습니다.'); history.go(-1)</script>";
		}
		session.setAttribute("resultId", result);
		return "<script> location.href='/MyZeneration_spring/member/idFindResult'; </script>";
	}

	//아이디찾기 결화 화면 보여주기
	@GetMapping("/idFindResult")
	public String idResultView(HttpSession session) {
		return "idFindResult";
	}

	//비밀번호 찾기 화면 보여주기
	@GetMapping("/pwFindView")
	public String pwFindView() {
		System.out.println("MemberController - pwFindView");
		return "pwFindView";
	}

	//비밀번호 찾기
	@PostMapping(value = "/verifyMember", produces = "text/html; charset=utf8")
	public @ResponseBody String verifyMember(@RequestParam String name, @RequestParam String id,
			@RequestParam String eMail, HttpSession session) {
		boolean result = memberService.verifyMember(name, id, eMail);
		if (result == false) {
			return "<script> alert('가입정보가 없습니다.'); history.go(-1)</script>";
		}
		session.setAttribute("idForFindingPw", id);
		return "<script> location.href='/MyZeneration_spring/member/pwChangeView'; </script>";
	}

	//비밀번호 찾기 결과 화면
	@GetMapping("/pwChangeView")
	public String pwChangeView() {
		return "pwChangeView";
	}

	//비밀번호 변경
	@PostMapping("/pwChange")
	public String pwChange(@RequestParam String pw, HttpSession session) {
		memberService.pwChange((String) session.getAttribute("idForFindingPw"), pw);
		return "pwChangeOk";
	}

	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout");
		session.setAttribute("memberId", "example");
		return "index";
	}

}
