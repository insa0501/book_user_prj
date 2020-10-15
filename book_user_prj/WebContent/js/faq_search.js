$(document).ready(function () {

    //select에서
    $('#faq_cate_select').change(function(){
        console.log(this.value);

        if(this.value == '전체') {
            setReset();
        } else {
            setCategory();        
        }
    })

    //input에서
    $('#input_text').keyup(function (event) {
        var inputText = $('#input_text').val();

        //엔터를 클릭할 시
        if (event.keyCode == 13) {
            console.log("엔터눌림")
            setSearch();
        }
        //만약 다 지워서 검색어가 없다면 목록 전체를 보여줌
        if (inputText == '') {
            console.log("다지워짐");
            setReset();
            setCategory();        
        }
    })//keyup end

    //검색버튼을 클릭했을 때
    $('#btn_submit').click(function () {
        setSearch();
    })//btn click end

}) //ready


function setSearch() {
    var inputText = $('#input_text').val();

    console.log(inputText);
    console.log("함수 탐");

    $('.ques_title').not(':contains("' + inputText + '")').parent().addClass('hidden');
}

function setReset() {
    $('.ques_title').parent().removeClass('hidden');
}

function setCategory() {
    setReset();
    var inputText = $('#faq_cate_select').val();
    if(inputText != '전체') {
        $('.ques_cate').not(':contains("' + inputText + '")').parent().addClass('hidden');
    }
}