function sendit(){
    const idCheck = RegExp(/^[a-zA-Z0-9]{6,20}$/);
    const pwCheck = RegExp(/^[a-zA-Z0-9]{6,20}$/);
    const nameCheck = RegExp(/^[가-힣]+$/);
    const hpCheck = RegExp(/^\d{3}-\d{3,4}-\d{4}$/);
    const emailCheck = RegExp(/^[a-zA-Z0-9\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-]+/);

    if(!idCheck.test($('#userid').val())){
        alert('아이디를 형식에 맞게 입력하세요');
        $('#userid').val('');
        $('#userid').focus();
        return false;
    }
	if($('#isIdCheck').val() == 'n'){
		alert('아이디 중복 체크를 확인하세요');
		$('#userid').focus();
		return false;
	}
    if(!pwCheck.test($('#userpw').val())){
        alert('비밀번호를 형식에 맞게 입력하세요');
        $('#userpw').val('');
        $('#userpw').focus();
        return false;
    }
    if($('#userpw').val() != $('#userpw_re').val()){
        alert('비밀번호가 서로 다릅니다');
        $('#userpw').val('');
        $('#userpw_re').val('');
        $('#userpw').focus();
        return false;
    }
    if(!nameCheck.test($('#username').val())){
        alert('이름은 한글로 입력하세요');
        $('#username').val('');
        $('#username').focus();
        return false;
    }
    if(!hpCheck.test($('#hp').val())){
        alert('휴대폰 형식에 맞게 입력하세요(- 포함)');
        $('#hp').val('');
        $('#hp').focus();
        return false;
    }
    if(!emailCheck.test($('#email').val())){
        alert('이메일을 형식에 맞게 입력하세요');
        $('#email').val('');
        $('#email').focus();
        return false;
    }
    
    let hobbyCheck = false;

    for(let i=0; i<$("[name='hobby']").length; i++){
        if($("input:checkbox[name='hobby']").eq(i).is(":checked") == true){
            hobbyCheck = true;
            break;
        }
    }
    if(!hobbyCheck){
        alert('취미는 한개이상 체크하세요');
        return false;
    }
    if($('#ssn1').val() == "" || $('#ssn2').val() == ""){
        alert('주민등록번호를 입력하세요');
        $('#ssn1').focus();
        return false;
    }
    if($('#isSsn').val() == 'n'){
        alert('주민등록번호 유효성 체크를 눌러주세요');
        return false;
    }

    return true;
}

$(function(){
	$("#btnIdCheck").on("click", function(){
		
		if($("#userid").val() == ""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		
		const xhr = new XMLHttpRequest();
		const userid = $("#userid").val();
		xhr.open("GET", "idcheck.jsp?userid="+userid, true);
		xhr.send();
		xhr.onreadystatechange  = function(){
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				const result = xhr.responseText;
				if(result.trim() == "ok"){
					// 아이디를 만들 수 있을 때(중복 아이디가 아닐 때)
					$("#idCheckMsg").html("<b style='color: red'>사용할 수 있는 아이디입니다.</b>");
					$("#isIdCheck").val("y");
				
				}else{
					// 아이디를 만들 수 없을 때(중복 아이디일 경우)
					$("#idCheckMsg").html("<b style='color: red'>사용할 수 없는 아이디입니다.</b>");
					
				
				}
			}
		}
		
	});
	$("#userid").on("keyup",function(){
		$("#isIdCheck").val("n");
		$("#idCheckMsg").html("");
	})
	
	
    $('#ssn1').on('keyup', function(){
        if($(this).val().length >= 6){
            $('#ssn2').focus();
        }
    });
    $('#ssn1, #ssn2').on('keydown', function(){
        $('#isSsn').val('n');
    });
    $("#ssnBtn").on('click', function(){
        let ssn = $('#ssn1').val() + $('#ssn2').val();
        let fmt = RegExp(/^\d{6}[12345]\d{6}/);
        let arr = new Array(13);
        if(!fmt.test(ssn)){
            alert('주민등록번호 형식에 맞게 입력하세요');
            $('#ssn1').val('');
            $('#ssn2').val('');
            $('#ssn1').focus();
            return false;
        }
        for(let i=0; i<arr.length; i++){
            arr[i] = parseInt(ssn.charAt(i))
        }
        const mul = [2,3,4,5,6,7,8,9,2,3,4,5];
        let sum = 0;
        for(let i=0; i<arr.length-1; i++){
            sum += (arr[i] *= mul[i])
        }
        if((11 - (sum % 11)) % 10 != arr[12]){
            alert('유효하지 않은 주민등록번호입니다.');
            $('#ssn1').val('');
            $('#ssn2').val('');
            $('#ssn1').focus();
            return false;
        }
        alert('검증되었습니다');
        $('#isSsn').val('y');
    });
});