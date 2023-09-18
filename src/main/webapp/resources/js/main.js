/*반응형 메뉴 토글*/
let button = document.querySelector('.btn');
let toggleList=document.querySelector('.toggleList')
button.addEventListener('click', ()=> {
        toggleList.classList.toggle('showing');
    })


const header_nav = document.querySelector('#header.alt');
const headerHeight = header_nav.getBoundingClientRect().height;
const topMenu = document.querySelectorAll('.top-menu');
const menuMobile = document.querySelector('.header-mobile');

document.addEventListener('scroll', () => {
if (window.scrollY > headerHeight) {
    header_nav.classList.add('colorChange');
} 
else{
    header_nav.classList.remove('colorChange');
}
});




//애니메이션 나타나기
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







