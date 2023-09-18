package com.project.MyZeneration_spring.vo;

import lombok.Data;

/*
 * 각 항목에 대한 점수 VO
 */

@Data
public class ItemScoreVO {

	private int sex;
	private int age;
	private int education;
	private int major;
	private int region;
	private int salary;
	private int familyNo;
	private int residence;
	private int workingHour;
	private int marriage;
	private int total;

	// total 제외
	public ItemScoreVO(int sex, int age, int education, int major, int region, int salary, int familyNo, int residence,
			int workingHour, int marriage) {
		super();
		this.sex = sex;
		this.age = age;
		this.education = education;
		this.major = major;
		this.region = region;
		this.salary = salary;
		this.familyNo = familyNo;
		this.residence = residence;
		this.workingHour = workingHour;
		this.marriage = marriage;
	}

	// sex, age, total 제외
	public ItemScoreVO(int education, int major, int region, int salary, int familyNo, int residence, int workingHour,
			int marriage) {
		super();
		this.education = education;
		this.major = major;
		this.region = region;
		this.salary = salary;
		this.familyNo = familyNo;
		this.residence = residence;
		this.workingHour = workingHour;
		this.marriage = marriage;
	}

	// 모든 속성
	public ItemScoreVO(int sex, int age, int education, int major, int region, int salary, int familyNo, int residence,
			int workingHour, int marriage, int total) {
		super();
		this.sex = sex;
		this.age = age;
		this.education = education;
		this.major = major;
		this.region = region;
		this.salary = salary;
		this.familyNo = familyNo;
		this.residence = residence;
		this.workingHour = workingHour;
		this.marriage = marriage;
		this.total = total;
	}

	public ItemScoreVO() {
		super();
	}
}
