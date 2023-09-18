package com.project.MyZeneration_spring.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.project.MyZeneration_spring.vo.ItemScoreVO;
import com.project.MyZeneration_spring.vo.ItemsVO;
import com.project.MyZeneration_spring.vo.MemberInfoVO;

/*
 *나의 만족도 예측 서비스,  MZ세대 만족도 분석 서비스 레파지토리 
 */

@Repository
public class CoreServiceRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;

	//나의 만족도 예측 서비스 -  회원 정보 내보내기 위한 클래스 생성
	private class MemberInfoMapper implements RowMapper<MemberInfoVO> {
		@Override
		public MemberInfoVO mapRow(ResultSet rs, int count) throws SQLException {
			MemberInfoVO memberInfo = new MemberInfoVO();
			memberInfo.setId(rs.getString("id"));
			memberInfo.setName(rs.getString("name"));
			memberInfo.setSex(rs.getString("sex"));
			memberInfo.setAge(rs.getInt("age"));
			memberInfo.setEducation(rs.getString("education"));
			memberInfo.setMajor(rs.getString("major"));
			memberInfo.setRegion(rs.getString("region"));
			memberInfo.setSalary(rs.getInt("salary"));
			memberInfo.setFamilyNo(rs.getInt("familyNo"));
			memberInfo.setResidence(rs.getString("residence"));
			memberInfo.setWorkingHour(rs.getString("workingHour"));
			memberInfo.setMarriage(rs.getString("marriage"));
			memberInfo.setLifeScore(rs.getInt("lifeScore"));
			return memberInfo;
		}
	}

	//나의 만족도 예측 서비스 - 회원 정보 내보내기
	public MemberInfoVO getMemberInfo(String memberId) {
		System.out.println("[CoreServiceRepository] getMemberInfo / memberId: " + memberId);
		String sql = "select  id, name, sex, age, education, major, region, salary, familyNo, residence ,workingHour, marriage, lifeScore  from membertotal where id=?";
		return jdbcTemplate.queryForObject(sql, new MemberInfoMapper(), memberId);
	}

	//나의 만족도 예측 서비스 - 회원 정보에 따른 각 항목 점수 정보 내보내기
	public ItemScoreVO getItemScore(ItemsVO items) {
		System.out.println("[CoreServiceRepository] getItemScore");
		ItemScoreVO itemScore = new ItemScoreVO();
		String sql = "select score from standard where item=?";
		itemScore.setSex(jdbcTemplate.queryForObject(sql, Integer.class, items.getSex()));
		itemScore.setAge(jdbcTemplate.queryForObject(sql, Integer.class, items.getAge()));
		itemScore.setEducation(jdbcTemplate.queryForObject(sql, Integer.class, items.getEducation()));
		itemScore.setMajor(jdbcTemplate.queryForObject(sql, Integer.class, items.getMajor()));
		itemScore.setRegion(jdbcTemplate.queryForObject(sql, Integer.class, items.getRegion()));
		itemScore.setSalary(jdbcTemplate.queryForObject(sql, Integer.class, items.getSalary()));
		itemScore.setFamilyNo(jdbcTemplate.queryForObject(sql, Integer.class, items.getFamilyNo()));
		itemScore.setResidence(jdbcTemplate.queryForObject(sql, Integer.class, items.getResidence()));
		itemScore.setWorkingHour(jdbcTemplate.queryForObject(sql, Integer.class, items.getWorkingHour()));
		itemScore.setMarriage(jdbcTemplate.queryForObject(sql, Integer.class, items.getMarriage()));
		itemScore.setTotal(itemScore.getSex() + itemScore.getAge() + itemScore.getEducation() + itemScore.getMajor()
				+ itemScore.getRegion() + itemScore.getSalary() + itemScore.getFamilyNo() + itemScore.getResidence()
				+ itemScore.getWorkingHour() + itemScore.getMajor());

		return itemScore;
	}

	//나의 만족도 예측 서비스 - DB에 부족한 항목에 대한 리스트를 저장
	public void insertRecommend(List<List<String>> lists) {
		System.out.println("[Notice] CoreServiceRepository: insertRecommend() execution");
		int listSize = lists.get(0).size();

		String sql = "insert into recommend (changeItem, predictLifeScore) values (?,?)";
		for (int i = 0; i < listSize; i++) {
			jdbcTemplate.update(sql, lists.get(0).get(i), Integer.parseInt(lists.get(1).get(i)));
		}
	}

	//나의 만족도 예측 서비스 - insertRecommend에서 입력한 데이터에 회원이 DB에 저장한 기존 데이터를 합친 후 정렬하여 데이터 내보내기
	public List<List<String>> orderItemChangeList(int lifeScore) {
		System.out.println("[Notice] CoreServiceRepository: exportRecommend() execution");
		List<String> oItemChanges = new ArrayList<String>();
		List<String> oLifeScores = new ArrayList<String>();
		List<String> ajaxLifeScore = new ArrayList<String>();
		List<List<String>> oRecommendLists = new ArrayList<List<String>>();

		oItemChanges.add("기존");
		oLifeScores.add(String.valueOf(lifeScore));

		String sql = "select changeItem from recommend order by predictLifeScore desc ";
		for (String item : jdbcTemplate.queryForList(sql, String.class)) {
			oItemChanges.add(item);
		}
		sql = "select predictLifeScore from recommend order by predictLifeScore desc ";
		for (String score : jdbcTemplate.queryForList(sql, String.class)) {
			oLifeScores.add(score);
		}
		ajaxLifeScore.add(String.valueOf(lifeScore));
		
		oRecommendLists.add(oItemChanges);
		oRecommendLists.add(oLifeScores);
		oRecommendLists.add(ajaxLifeScore);
		
		sql = "delete from recommend";
		jdbcTemplate.update(sql);
		return oRecommendLists;
	}

	//MZ세대 만족도 분석 서비스 - 중복으로 선택된 각 항목에 대한 count 및 항목 데이터 내보내기
	public List<String> getRatioArray(String[] sexList, String[] ageList, String[] lifeScoreList, String category) {
		String sql = "";
		String sex = toStringSql(sexList);
		String age = toAgeStringSql(ageList);
		String lifeScore = toLifeScoreStringSql(lifeScoreList);

		if (category.equals("education")) {
			sql = "select count(*) as count, education as category  from bigdatatotal where sex IN " + sex + " and age IN " + age
					+ " and lifeScore IN " + lifeScore + " group by education order by count desc";
		} else if (category.equals("major")) {
			sql = "select count(*) as count, major as category from bigdatatotal where sex IN " + sex + " and age IN " + age
					+ " and lifeScore IN " + lifeScore + " group by major order by count desc";
		} else if (category.equals("salary")) {
			sql = "select count(*) as count, salary as category from bigdatatotal where sex IN " + sex + " and age IN " + age
					+ " and lifeScore IN " + lifeScore + " group by salary order by count desc";
		} else if (category.equals("familyNo")) {
			sql = "select count(*) as count, familyNo as category from bigdatatotal where sex IN " + sex + " and age IN " + age
					+ " and lifeScore IN " + lifeScore + " group by familyNo order by count desc";
		} else if (category.equals("region")) {
			sql = "select count(*) as count, region as category from bigdatatotal where sex IN " + sex + " and age IN " + age
					+ " and lifeScore IN " + lifeScore + " group by region order by count desc";
		}
		List<Integer> countList = jdbcTemplate.query(sql, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("count");
			}
		});
		List<String> itemList = jdbcTemplate.query(sql, new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("category");
			}
		});
		
		String ratios = toRatio(countList);
		String items = String.join(",", itemList);

		List<String> totalList = new ArrayList<String>();
		totalList.add(items);
		totalList.add(ratios);

		return totalList;
	}

	//ajax로 내보내기 위해 String 형태로 만들어주는 메소드
	public String makeString(List<String> lists) {
		String stringList = "";
		for (int i = 0; i < lists.size(); i++) {
			stringList += lists.get(i);
			if (i != lists.size() - 1) {
				stringList += ",";
			}
		}
		return stringList;
	}

	// count를 받아서 비율 String으로 만들어 줌
	public String toRatio(List<Integer> counts) {
		int sum = 0;
		String ratios = "";
		List<String> ratioList = new ArrayList<String>();

		for (Integer count : counts) {
			sum += count;
		}
		for (Integer count : counts) {
			double ratio = ((double) count / sum) * 100.0;
			ratioList.add(String.format("%.1f", ratio));
		}

		ratios = String.join(",", ratioList);
		return ratios;
	}

	// 중복문 sql을 위해 ('a','b','c')형태로 만들어 줌
	public String toStringSql(String[] list) {
		String contentSql = "";
		for (int i = 0; i < list.length; i++) {
			contentSql += "'" + list[i] + "'";
			if (i != list.length - 1) {
				contentSql += ",";
			}
		}
		return "(" + contentSql + ")";
	}

	// 중복문 sql을 위해 static하게 고정해놓은 메소드-> 나이
	public String toAgeStringSql(String[] list) {
		String contentSql = "";

		for (String age : list) {
			if (age.equals("20대 초반")) {
				contentSql += "20,21,22,23";
			} else if (age.equals("20대 중반")) {
				contentSql += "24,25,26";
			} else if (age.equals("20대 후반")) {
				contentSql += "27,28,29";
			} else if (age.equals("30대 초반")) {
				contentSql += "30,31,32,33";
			} else if (age.equals("30대 중반")) {
				contentSql += "34,35,36";
			} else if (age.equals("30대 후반")) {
				contentSql += "37,38,39";
			}
		}
		return "(" + contentSql + ")";
	}

	// 중복문 sql을 위해 삶의 만족도 80점대 등으로 입력되면 80~89로 배열에 값 삽입 후 (a,b,c)형태로 만들어 줌
	public String toLifeScoreStringSql(String[] list) {
		String contentSql = "";
		List<Integer> intArray = new ArrayList<Integer>();
		for (int i = 0; i < list.length; i++) {
			for (int j = 0; j < list.length * 10; j++) {
				intArray.add(Integer.parseInt(list[i]) + j);
			}
		}
		for (int i = 0; i < intArray.size(); i++) {
			contentSql += intArray.get(i); // arrInt 배열을 문자열로 만들어 줌
			if (i != intArray.size() - 1) {
				contentSql += ",";
			}
		}
		return "(" + contentSql + ")";
	}
}
