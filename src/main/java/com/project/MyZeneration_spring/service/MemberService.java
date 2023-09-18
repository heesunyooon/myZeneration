package com.project.MyZeneration_spring.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.MyZeneration_spring.repository.MemberRepository;
import com.project.MyZeneration_spring.vo.MemberJoinVO;
import com.project.MyZeneration_spring.vo.SurveyVO;

/*
 * 회원관리 (회원가입, 로그인, 아이디찾기, 비밀번호 찾기), 로그인 서비스
 */

@Service
public class MemberService implements IMemberService {

	@Autowired
	MemberRepository mRepository;

	public boolean memberCheck(String id, String password) {
		return mRepository.isMember(id, password);
	}

	public int join(MemberJoinVO memberJoinVO, HttpSession session) {

		boolean isIdSame = mRepository.hasId(memberJoinVO.getId());
		boolean isEmailSame = mRepository.hasEmail(memberJoinVO.getName(), memberJoinVO.getEMail());

		if (!memberJoinVO.getPw().equals(memberJoinVO.getPw_check())) {
			return 1;
		} else if (isIdSame) {
			return 2;
		} else if (isEmailSame) {
			return 3;
		} else {
			mRepository.join(memberJoinVO);
			session.setAttribute("memberId", memberJoinVO.getId());
			return 0;
		}
	}

	public boolean hasId(String id) {
		boolean isIdSame = mRepository.hasId(id);
		if (isIdSame) {
			return true;
		}
		return false;
	}

	public void inputSurveyData(SurveyVO surveyVO, String id) {
		System.out.println("[Notice] MemberService: inputSurveyData() execution");
		mRepository.inputSurveyData(surveyVO, id);
	}

	public String idFind(String name, String eMail) throws Exception {
		return mRepository.idFind(name, eMail);
	}
	
	public boolean verifyMember(String name, String id, String eMail) {
		return mRepository.verifyMember(name, id, eMail);
	}
	
	public void pwChange(String id, String pw) {
		mRepository.pwChange(id, pw);
	}
}
