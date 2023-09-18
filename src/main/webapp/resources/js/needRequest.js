/**
 * 유효성 검증
 */
function requestCheck() {
	if (document.category.sex.value.length == 0) {
		alert('성별을 선택해주세요.');
		return;
	}
	if (document.category.age.value.length == 0) {
		alert('연령을 선택해주세요.');
		return;
	}
	if (document.category.lifeScore.value.length == 0) {
		alert('삶의 만족도 점수를 선택해주세요.');
		return;
	}
	document.category.submit();
}

// -------------------------------------
// 회원가입 시 유효성검증
function joinCheck() {
	if (document.memberJoin.id.value.length == 0) {
		alert('아이디를 입력해주세요.');
		memberJoin.id.focus(); // 입력창 반짝반짝
		return;
	}
	if (document.memberJoin.pw.value.length == 0) {
		alert('비밀번호를 입력해주세요.');
		memberJoin.pw.focus();
		return;
	}
	if (document.memberJoin.pw.value != document.memberJoin.pw_check.value) {
		alert('비밀번호가 같지 않습니다.');
		memberJoin.pw.focus();
		return;

	}
	if (document.memberJoin.name.value == 0) {
		alert('이름을 입력해주세요.');
		memberJoin.name.focus();
		return;
	}
	if (document.memberJoin.eMail.value == 0) {
		alert('이메일을 입력해주세요.');
		memberJoin.eMail.focus();
		return;
	}
	if (!document.memberJoin.eMail.value.includes('@')) {
		console.log('a');
		alert('@를 포함한 이메일 형식으로 다시 입력해주세요.');
		memberJoin.eMail.focus();
		return;
	}
	if (document.memberJoin.tel.value == 0) {
		alert('"-"를 뺀 숫자만 입력해주세요.');
		memberJoin.tel.focus();
		return;
	}

	document.memberJoin.action = "/MyZeneration_spring/member/join";
	document.memberJoin.submit();

}

// 회원가입 시 중복확인
function idCheck() {
	if (document.memberJoin.id.value == 0) {
		alert('아이디를 입력해주세요.');
		memberJoin.id.focus(); // 입력창 반짝반짝
		return;
	}
	document.memberJoin.action = "/MyZeneration_spring/member/idCheck";
	document.memberJoin.submit();
}

// form이 null인지 확인
function checkNullSurvey() {
	if (document.survey.sex.value.length == 0) {
		alert('성별을 선택해주세요.');
		return;
	}
	if (document.survey.age.value == 0) {
		alert('나이를 선택해주세요.');
		return;
	}
	if (document.survey.education.value.length == 0) {
		alert('최종학력을 선택해주세요.');
		return;
	}
	if (document.survey.major.value.length == 0) {
		alert('전공분류를 선택해주세요.');
		return;
	}
	if (document.survey.region.value.length == 0) {
		alert('거주하시는 지역을 선택해주세요.');
		return;
	}
	if (document.survey.salary.value == 0) {
		alert('세전급여를 선택해주세요.');
		return;
	}
	if (document.survey.familyNo.value.length == 0) {
		alert('가구원수를 선택해주세요.');
		return;
	}
	if (document.survey.residence.value == 0) {
		alert('거주형태를 선택해주세요.');
		return;
	}
	if (document.survey.workingHour.value == 0) {
		alert('근로시간을 선택해주세요.');
		return;
	}
	if (document.survey.marriage.value == 0) {
		alert('결혼여부를 선택해주세요.');
		return;
	}
	if (document.survey.lifeScore.value == 0) {
		alert('삶의 만족도를 선택해주세요.');
		return;
	}

	document.survey.action = "/MyZeneration_spring/member/surveyComplete";
	document.survey.submit();
}
