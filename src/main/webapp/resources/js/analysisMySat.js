//나의 만족도 예측 서비스

//요소 지정
let sexSelect = document.getElementById("sexSelect");
let ageSelect = document.getElementById("ageSelect");
let educationSelect = document.getElementById("educationSelect");
let majorSelect = document.getElementById("majorSelect");
let regionSelect = document.getElementById("regionSelect");
let salarySelect = document.getElementById("salarySelect");
let familyNoSelect = document.getElementById("familyNoSelect");
let residenceSelect = document.getElementById("residenceSelect");
let workingHourSelect = document.getElementById("workingHourSelect");
let marriageSelect = document.getElementById("marriageSelect");

// 부족한 항목 알려줄 때
let itemList =document.getElementById("badItemList");

// 동일조건 평균 만족도 알려줄 때
let averageScore = document.getElementById("totalScore");

function sendRadarAjaxRequest(){
    var myRadarChart;
    
    let selectedSexValue =sexSelect.value;
    let selectedAgeValue =ageSelect.value;
    let selectedEducationValue =educationSelect.value;
    let selectedMajorValue =majorSelect.value;
    let selectedRegionValue =regionSelect.value;
    let selectedSalaryValue =salarySelect.value;
    let selectedFamilyNoValue =familyNoSelect.value;
    let selectedResidenceValue =residenceSelect.value;
    let selectedWorkingHourValue =workingHourSelect.value;
    let selectedMarriageValue =marriageSelect.value;

    if(myRadarChart){
        myRadarChart.destroy();
    }
     
    $.ajax({
    	type:'post',
        url:'./updateRadarChart',
        contentType:"application/json;charset=UTF-8",
        data: JSON.stringify({
        	'sex':selectedSexValue,
        	'age':selectedAgeValue,
            'education':selectedEducationValue,
            'major':selectedMajorValue,
            'region':selectedRegionValue,
            'salary':selectedSalaryValue,
            'familyNo':selectedFamilyNoValue,
           'residence':selectedResidenceValue,
            'workingHour':selectedWorkingHourValue,
            'marriage':selectedMarriageValue
        }),
        success: function(response){
            console.log("AJAX 요청 성공");
            var radarRatioResult = response[0].map(function(item) {
            	  return parseInt(item, 10); 
            	});
            var badItemList = response[1].map(function(item) {
            	  return String(item);
            	});
            var totalScore = response[2].map(function(item) {
          	  return String(item);
          	});
        	itemList.textContent = badItemList;
        	averageScore.textContent=totalScore+'점';
        	
            var itemRatioData={
                labels:['학력','전공','거주지역','연임금','가구인원 수','거주형태','근로시간','결혼여부'],
                datasets:[{
                    data:radarRatioResult,
                    fill: true,
                    backgroundColor: 'rgba(13, 102, 225, 0.2)',
                    borderColor: 'rgb(13, 102, 221)',
                    pointBackgroundColor: 'rgb(54, 162, 235, 0.2)',
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#fff',
                    pointHoverBorderColor: 'rgb(54, 162, 235)'
            }]
        };
        var radarChart = document.getElementById('radar').getContext('2d');
        myRadarChart = new Chart(radarChart, {
            type: 'radar',
            data: itemRatioData,
            options: {
                legend:{
                    display:false
                },
                scale: {
                    ticks: {
                        beginAtZero: true, 
                        min: 0, 
                        max: 100, 
                        stepSize: 20,
                        suggestedMin: 0, 
                        suggestedMax: 100, 
                    }
                }
            }
        });},
    error:function(data){
        console.log(data);
    	console.log("AJAX 요청 실패");
    }
});
}// sendRadarAjaxRequest() 끝

 sendRadarAjaxRequest();
 
const elements = [
	  { id: 'sexSelect', value: '' },
	  { id: 'ageSelect', value: '' },
	  { id: 'educationSelect', value: '' },
	  { id: 'majorSelect', value: '' },
	  { id: 'regionSelect', value: '' },
	  { id: 'salarySelect', value: '' },
	  { id: 'familyNoSelect', value: '' },
	  { id: 'residenceSelect', value: '' },
	  { id: 'workingHourSelect', value: '' },
	  { id: 'marriageSelect', value: '' },
	];





// ====================================================
let changeTop1 =document.getElementById("changeTop1");
let changeTop2 =document.getElementById("changeTop2");
let changeTop3 =document.getElementById("changeTop3");

let myScore = document.getElementById("ajaxLifeScore");

let increaseRatio1 = document.getElementById("increaseRatio1");


function sendBarAjaxRequest(){
		
	let selectedSexValue =sexSelect.value;
	let selectedAgeValue =ageSelect.value;
	let selectedEducationValue =educationSelect.value;
	let selectedMajorValue =majorSelect.value;
	let selectedRegionValue =regionSelect.value;
	let selectedSalaryValue =salarySelect.value;
	let selectedFamilyNoValue =familyNoSelect.value;
	let selectedResidenceValue =residenceSelect.value;
	let selectedWorkingHourValue =workingHourSelect.value;
	let selectedMarriageValue =marriageSelect.value;

	if (window.myBarChart){
		window.myBarChart.destroy();
    }
	
    $.ajax({
        type:'post',
        url:'./updateBarChart',
        contentType:"application/json;charset=UTF-8",
        data: JSON.stringify({
        	'sex':selectedSexValue,
        	'age':selectedAgeValue,
            'education':selectedEducationValue,
            'major':selectedMajorValue,
            'region':selectedRegionValue,
            'salary':selectedSalaryValue,
            'familyNo':selectedFamilyNoValue,
           'residence':selectedResidenceValue,
            'workingHour':selectedWorkingHourValue,
            'marriage':selectedMarriageValue
        }),
        success: function(response){
        	
        	var itemChangeRecommend = response[0].map(function(item) {
          	  return String(item);
          	});
        	
        	var predictLifeScore = response[1].map(function(item) {
          	  return parseInt(item, 10); 
          	});
        	
        	
        	console.log(itemChangeRecommend);
        	console.log(predictLifeScore);
        	console.log(response[2]);
        	
        	
        	// 아이템 추천 항목
        	changeTop1.textContent = itemChangeRecommend[1];
        	changeTop2.textContent = itemChangeRecommend[2];
        	changeTop3.textContent = itemChangeRecommend[3];
        	myScore.textContent = response[2]+'점';
        	
        	
        	// 아이템 변경에 따른 추천 항목
        	increaseRatio1.textContent = ((predictLifeScore[1]-predictLifeScore[0])*100/predictLifeScore[0]).toFixed(1)+' %';
        	increaseRatio2.textContent = ((predictLifeScore[2]-predictLifeScore[0])*100/predictLifeScore[0]).toFixed(1)+' %';
        	increaseRatio3.textContent = ((predictLifeScore[3]-predictLifeScore[0])*100/predictLifeScore[0]).toFixed(1)+' %';

        	var barData = {
        		    labels: itemChangeRecommend, // x축 배열 (변경사항)
        		    datasets: [{
        		        data: predictLifeScore, // y축 배열 (예상만족도)
        		        barThickness: 40,
        		        backgroundColor: ['#BFBFBF','#2C71AC','#4E96D2','#7EB3DE','#BCD7EE','#A9DBDA'],
        		    }]
        		};
        	
        	 var barChart = document.getElementById('bar').getContext('2d');
        	   window.myBarChart = new Chart(barChart, {
        	   type: 'bar', 
        	   data: barData,
        	   options: {
        		   legend: {
        			   display:false
        		   },
        		   barThickness: 6,
        	       scales:{
        	        yAxes: [{
        	                ticks:{
        	                        display:true,
        	                        min:Math.min(...predictLifeScore)-5,
        	                        max:Math.max(...predictLifeScore)+1,
        	                        stepSize:1,
        	                }
        	        }]
        	       },
        	}
        	});},
    error:function(error){
        console.log("실패");
    }
});
}// sendRadarAjaxRequest() 끝
	
sendBarAjaxRequest();
	

document.addEventListener('DOMContentLoaded', function() {
	elements.forEach(element => {
		const el = document.getElementById(element.id);
		el.addEventListener('change', sendRadarAjaxRequest);
		el.addEventListener('change', sendBarAjaxRequest);
	});
});
	
