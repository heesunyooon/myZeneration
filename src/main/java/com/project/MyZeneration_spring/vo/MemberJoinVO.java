package com.project.MyZeneration_spring.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
 * 사이트에서 회원 가입 시 사용되는 VO
 */

@Data
public class MemberJoinVO {// 사이트 회원가입 정보

	private String id;
	private String pw;
	private String pw_check;
	private String name;
	private String eMail;
	private String tel;
	private Timestamp joinDate;

	public MemberJoinVO() {
	}

	public MemberJoinVO(String id, String pw, String pw_check, String name, String eMail, String tel,
			Timestamp joinDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.pw_check = pw_check;
		this.name = name;
		this.eMail = eMail;
		this.tel = tel;
		this.joinDate = joinDate;
	}

	

}
