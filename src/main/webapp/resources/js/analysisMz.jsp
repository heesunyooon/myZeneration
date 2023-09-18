//MZ세대 만족도 분석 서비스

const chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 8,
    },
    plugins: {
        legend: {
            labels: {
                usePointStyle: true,
                padding: 1,
            }
        },
        datalabels: {
            color: 'white', // 라벨 텍스트 색상
            backgroundColor: 'rgba(0, 0, 0, 0.7)', // 라벨 배경색
            borderColor: 'transparent', // 라벨 테두리 색상
            borderWidth: 3, // 라벨 테두리 두께
            borderRadius: 4, // 라벨 테두리 모양 조절
            anchor: 'center', // 데이터 라벨을 그래프 요소의 중앙에 붙일지 설정
            align: 'center', // 데이터 라벨의 정렬 방식 설정
            offset: 8, // 데이터 라벨과 그래프 요소의 간격 조절
            font: {
                weight: 'bold' // 라벨 텍스트 굵기
            }
        }
    },
    cutoutPercentage: 0,
};


function sendDoughnutAjaxRequest(){
	
	if(window.myEduChart){
		window.myEduChart.destroy();
    }
	if(window.myMajorChart){
		window.myMajorChart.destroy();
    }
	if(window.mySalaryChart){
		window.mySalaryChart.destroy();
    }
	if(window.myFamilyNoChart){
		window.myFamilyNoChart.destroy();
    }
	if(window.myRegionChart){
		window.myRegionChart.destroy();
    }
	
	
	
	//DOM 사용하기 위해 table에 tr 지정 (항목)
	const trEduItem = document.getElementById("trEduItem");
	const trMajorItem = document.getElementById("trMajorItem");
	const trSalaryItem = document.getElementById("trSalaryItem");
	const trFamilyNoItem = document.getElementById("trFamilyNoItem");
	const trRegionItem = document.getElementById("trRegionItem");
	
	//DOM 사용하기 위해 table에 tr 지정 (비율)
	const trEduRatio = document.getElementById("trEduRatio");
	const trMajorRatio = document.getElementById("trMajorRatio");
	const trSalaryRatio = document.getElementById("trSalaryRatio");
	const trFamilyNoRatio = document.getElementById("trFamilyNoRatio");
	const trRegionRatio = document.getElementById("trRegionRatio");
	
	//값이 변하면 테이블 DOM요소 삭제 - 항목
	while (trEduItem.firstChild) {
		trEduItem.removeChild(trEduItem.firstChild);
	}
	while (trMajorItem.firstChild) {
		trMajorItem.removeChild(trMajorItem.firstChild);
	}
	while (trSalaryItem.firstChild) {
		trSalaryItem.removeChild(trSalaryItem.firstChild);
	}
	while (trFamilyNoItem.firstChild) {
		trFamilyNoItem.removeChild(trFamilyNoItem.firstChild);
	}
	while (trRegionItem.firstChild) {
		trRegionItem.removeChild(trRegionItem.firstChild);
	}
	
	//값이 변하면 테이블 DOM요소 삭제 - 비율
	while (trEduRatio.firstChild) {
		trEduRatio.removeChild(trEduRatio.firstChild);
	}
	while (trMajorRatio.firstChild) {
		trMajorRatio.removeChild(trMajorRatio.firstChild);
	}
	while (trSalaryRatio.firstChild) {
		trSalaryRatio.removeChild(trSalaryRatio.firstChild);
	}
	while (trFamilyNoRatio.firstChild) {
		trFamilyNoRatio.removeChild(trFamilyNoRatio.firstChild);
	}
	while (trRegionRatio.firstChild) {
		trRegionRatio.removeChild(trRegionRatio.firstChild);
	}
	
	var sexSelections = document.querySelectorAll("input[name='sex']:checked");
	var selectedSexValues = Array.from(sexSelections).map(sexCheckbox => sexCheckbox.value);
	var ageSelections = document.querySelectorAll("input[name='age']:checked");
	var selectedAgeValues = Array.from(ageSelections).map(ageCheckbox => ageCheckbox.value);
	
	var lifeScoreSelections = document.querySelectorAll("input[name='lifeScore']:checked");
	var selectedLlifeScoreValues = Array.from(lifeScoreSelections).map(lifeScoreCheckbox => lifeScoreCheckbox.value);
	
	$.ajax({
		type:'post',
		url:'./updateDoughnutChart',
        contentType:"application/json;charset=UTF-8",
		data:JSON.stringify({
			'sexList':selectedSexValues,
			'ageList':selectedAgeValues,
			'lifeScoreList':selectedLlifeScoreValues
		}),
		
		success: function(response){
			console.log(response);
			
			//여긴 안건드려도 됨
			document.getElementById("sexSelect").textContent = selectedSexValues+'성';
			document.getElementById("ageSelect").textContent = selectedAgeValues;
			document.getElementById("lifeScoreSelect").textContent = selectedLlifeScoreValues+'점 대';
			
			//각 항목에 해당하는 레이블
			const educationLables = response[0][0].split(',');
			const majorLables = response[1][0].split(',');
			const salaryLables = response[2][0].split(',');
			const familyNoLables = response[3][0].split(',');
			const regionLables = response[4][0].split(',');
			console.log(regionLables);
			
			//각 항목에 해당하는 값
			const educationDatas = response[0][1].split(',').map(Number);
			const majorDatas = response[1][1].split(',').map(Number);
			const salaryDatas = response[2][1].split(',').map(Number);
			const familyNoDatas = response[3][1].split(',').map(Number);
			const regionDatas = response[4][1].split(',').map(Number);
			
			//각 항목과 비율을 테이블에 뿌림	
			//학력별 정보
			educationLables.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item;
	            trEduItem.appendChild(th);
		    });
			educationDatas.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' %';
	            trEduRatio.appendChild(th);
			});

			//전공별 정보
			majorLables.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item;
	            trMajorItem.appendChild(th);
		    });
			majorDatas.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' %';
	            trMajorRatio.appendChild(th);
			});
			
			//연봉별 정보
			salaryLables.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' 만원 대';
	            trSalaryItem.appendChild(th);
		    });
			salaryDatas.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' %';
	            trSalaryRatio.appendChild(th);
			});
			
			//가구원수별 정보
			familyNoLables.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+'인 가구';
	            trFamilyNoItem.appendChild(th);
		    });
			familyNoDatas.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' %';
	            trFamilyNoRatio.appendChild(th);
			});
			
			//지역별 정보
			regionLables.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item;
	            trRegionItem.appendChild(th);
		    });
			
			regionDatas.forEach(function(item) {
	            var th = document.createElement("th");
	            th.textContent = item+' %';
	            trRegionRatio.appendChild(th);
			});
			
			//도넛그래프
			var education = document.getElementById("education").getContext('2d');
	            window.myEduChart = new Chart(education, {
	                type: 'doughnut',
	                data: {
	                    labels: educationLables,
	                    datasets: [
	                        {
	                            data: educationDatas,
	                            backgroundColor: ['rgb(7,77,129)', 'rgb(32,203,194)', 'rgb(64,178,230)'],
	                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	                            hoverBorderColor: "rgba(234, 236, 244, 1)",
	                        }
	                    ],
	                },
	                options: chartOptions, // 공통 옵션 사용
	            });
	            
	            var major = document.getElementById("major").getContext('2d');
	            myMajorChart = new Chart(major, {
	                type: 'doughnut',
	                data: {
	                    labels: majorLables,
	                    datasets: [
	                        {
	                            data: majorDatas,
	                            backgroundColor: ['rgb(7,77,129)', 'rgb(32,203,194)', 'rgb(64,178,230)'],
	                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	                            hoverBorderColor: "rgba(234, 236, 244, 1)",
	                        }
	                    ],
	                },
	                options: chartOptions, // 공통 옵션 사용
	            });
	            
	            var salary = document.getElementById("salary").getContext('2d');
	            mySalaryChart = new Chart(salary, {
	                type: 'doughnut',
	                data: {
	                    labels: salaryLables,
	                    datasets: [
	                        {
	                            data: salaryDatas,
	                            backgroundColor: ['rgb(7,77,129)', 'rgb(32,203,194)', 'rgb(64,178,230)'],
	                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	                            hoverBorderColor: "rgba(234, 236, 244, 1)",
	                        }
	                    ],
	                },
	                options: chartOptions, // 공통 옵션 사용
	            });
	            
	            
	            var familyNo = document.getElementById("familyNo").getContext('2d');
	            myFamilyNoChart = new Chart(familyNo, {
	                type: 'doughnut',
	                data: {
	                    labels: familyNoLables,
	                    datasets: [
	                        {
	                            data: familyNoDatas,
	                            backgroundColor: ['rgb(7,77,129)', 'rgb(32,203,194)', 'rgb(64,178,230)','rgb(204,153,255)','rgb(134,60,231)'],
	                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	                            hoverBorderColor: "rgba(234, 236, 244, 1)",
	                        }
	                    ],
	                },
	                options: chartOptions, // 공통 옵션 사용
	            });
	            
	            var region = document.getElementById("region").getContext('2d');
	            myRegionChart = new Chart(region, {
	                type: 'doughnut',
	                data: {
	                    labels: regionLables,
	                    datasets: [
	                        {
	                            data: regionDatas,
	                            backgroundColor: ['rgb(7,77,129)', 'rgb(32,203,194)', 'rgb(64,178,230)'],
	                            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	                            hoverBorderColor: "rgba(234, 236, 244, 1)",
	                        }
	                    ],
	                },
	                options: chartOptions, // 공통 옵션 사용
	            });
	            
	            
	            
	        },
		error:function(error){
			console.log("실패")
			alert("항목을 선택해주세요.")
			window.location.href="/MyZeneration_spring/core/analysisMz?sex=남,여&age=30대 초반&lifeScore=80";
		}
	});
	
}// sendDoughnutAjaxRequest() 끝

sendDoughnutAjaxRequest();


sexButtons.forEach(sexButton => {
    const sb = document.getElementById(sexButton.id);
    sb.addEventListener('change', () => {
        selecetedSexValue = sb.value;
        sendDoughnutAjaxRequest(); // 값이 변경될 때마다 함수 호출
        console.log(selecetedSexValue);
    });
});

ageButtons.forEach(ageButton => {
    const ab = document.getElementById(ageButton.id);
    ab.addEventListener('change', () => {
        selecetedAgeValue = ab.value;
        sendDoughnutAjaxRequest(); // 값이 변경될 때마다 함수 호출
        console.log(selecetedAgeValue);
    });
});

lifeScoreButtons.forEach(lifeScoreButton => {
    const lb = document.getElementById(lifeScoreButton.id);
    lb.addEventListener('change', () => {
        selecetedLifeScoreValue = lb.value;
        sendDoughnutAjaxRequest(); // 값이 변경될 때마다 함수 호출
        console.log(selecetedLifeScoreValue);
    });
});














