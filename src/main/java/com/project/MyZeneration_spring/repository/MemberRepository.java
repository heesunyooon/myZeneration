package com.project.MyZeneration_spring.repository;


import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.MyZeneration_spring.vo.MemberJoinVO;
import com.project.MyZeneration_spring.vo.SurveyVO;

/*
 * 회원관리 (회원가입, 로그인, 아이디찾기, 비밀번호 찾기), 로그인 레파지토리 
 */

@Repository
public class MemberRepository extends Connector {

	@Autowired
	JdbcTemplate jdbcTemplate;

	//회원여부 확인
	public boolean isMember(String id, String password) {
		System.out.println("[Notice] MemberRepository: isMember() execution");
		String sql = "select count(*) from membertotal where id=? and pw=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, id, password);

		if (result == 1) {
			return true;
		} else if (result == 0) {
			return false;
		} else {
			return false;
		}
	}

	//아이디 중복 확인
	public boolean hasId(String id) {
		System.out.println("[Notice] MemberRepository: idCheck() execution");
		String sql = "select count(*) from membertotal where id =?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, id);

		if (result >= 1) {
			return true;
		}
		return false;
	}

	//이메일 중복확인
	public boolean hasEmail(String name, String eMail) {
		System.out.println("[Notice] MemberRepository: idCheck() execution");
		String sql = "select count(*) from membertotal where name=? and eMail=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, name, eMail);

		if (result >= 1) {
			return true;
		}
		return false;
	}

	//회원 가입
	public void join(MemberJoinVO memberJoinVO) {
		memberJoinVO.setJoinDate(new Timestamp(System.currentTimeMillis()));
		String sql = "insert into membertotal (id, pw, name, eMail, tel, joinDate) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, memberJoinVO.getId(), memberJoinVO.getPw(), memberJoinVO.getName(),
				memberJoinVO.getEMail(), memberJoinVO.getTel(), memberJoinVO.getJoinDate());
	}

	//만족도조사 정보 저장
	public void inputSurveyData(SurveyVO surveyVO, String id) {
		String sql = "update membertotal set sex=?, age=?, education=?, major=?,"
				+ "region=?, salary=?, familyNo=?, residence=?, workingHour=?," + "marriage=? ,lifeScore=? where id=?";
		jdbcTemplate.update(sql, surveyVO.getSex(), surveyVO.getAge(), surveyVO.getEducation(), surveyVO.getMajor(),
				surveyVO.getRegion(), surveyVO.getSalary(), surveyVO.getFamilyNo(), surveyVO.getResidence(),
				surveyVO.getWorkingHour(), surveyVO.getMarriage(), surveyVO.getLifeScore(), id);
	}

	//아이디 찾기
	public String idFind(String name, String eMail) throws Exception {
		System.out.println("idFind");
		String sql = "select id from membertotal where name=? and eMail=?";
		try {
			return jdbcTemplate.queryForObject(sql, String.class, name, eMail);
		} catch (Exception e) {
			return null;
		}
	}

	//아이디 찾기- 회원 검증
	public boolean verifyMember(String name, String id, String eMail) {
		String sql = "select count(*) from membertotal where name=? and id=? and eMail=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, name, id, eMail);	
		
		if (result == 1) {
			return true;
		}
		return false;
	}
	
	//비밀번호 변경
	public void pwChange(String id, String pw) {
		System.out.println("레파지토리-pwChange");
		String sql = "update membertotal set pw=? where id=?";
		jdbcTemplate.update(sql, pw, id);
	}
}
