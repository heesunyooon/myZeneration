//화면 공통 - 애니메이션 (나타나기)
$.fn.isInViewport = function() {
			    var elementTop = $(this).offset().top;
			    var elementBottom = elementTop + $(this).outerHeight();
	
			    var viewportTop = $(window).scrollTop();
			    var viewportBottom = viewportTop + $(window).height();
	
			    return elementBottom > viewportTop + 50 && elementTop < viewportBottom -50;
			};
			$(window).on('load resize scroll',function(){
			    $('.ani').each(function(){
			        if($(this).isInViewport()){
			            $(this).addClass('active');
			        }
			    });
			});
			
			
			
let postRequest = document.getElementById("postRequest");
postRequest.addEventListener('click',()=>{
	
})
