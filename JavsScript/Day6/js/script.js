function sendit(){
    // alert('sendit() 호출');
    
    
    // 객체 생성 부분
    const frm = document.getElementById('regform');
    const userid = document.getElementById('userid');
    const userpw = document.getElementById('userpw');
    const userpw_re = document.getElementById('userpw_re');
    const username = document.getElementById('username');
    const hp = document.getElementById('hp');
    const email = document.getElementById('email');
    const hobby = document.getElementsByName('hobby');
    const isSsn = document.getElementById('isSsn');
    const zipcode = document.getElementById('zipcode');


    // 정규식 
    const expNameText = /[가-힣]+$/;   // 이 범위 내에서 1자 이상 반복되어 나오다가 끝이난다.
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;

    // 아이디 검증
    // 아이디를 입력 안했을 때
    if(userid.value == ''){
        alert('아이디를 입력하세요');
        userid.focus(); //포커스를 맞춰준다.
        return false;  // 더이상 진행이 되지 않도록 false를 리턴한다.
    }

    if(userid.value.length < 4 || userid.value.length > 20){
        alert('아이디는 4자 이상 20자 이하로 입력하세요');
        userid.focus();
        return false;
    }



    // 비밀번호 검증
    if(userpw.value == ''){
        alert('비밀번호를 입력하세요');
        userpw.focus(); //포커스를 맞춰준다.
        return false;  // 더이상 진행이 되지 않도록 false를 리턴한다.
    }

    // 비밀번호 확인
    if(userpw.value != userpw_re.value){
        alert('비밀번호 값이 서로 다릅니다.');
        userpw.focus();
        return false;
    }

    // 이름 검증
    if(!expNameText.test(username.value)){   // 정규식 만족 못할 경우
        alert('이름 형식을 확인하세요');
        username.focus();
        return false;
    }

    // 휴대폰 검증
    if(!expHpText.test(hp.value)){   // 정규식 만족 못할 경우
        alert('휴대폰번호 형식을 확인하세요');
        hp.focus();
        return false;
    }

    // 이메일 검증
    if(!expEmailText.test(email.value)){   // 정규식 만족 못할 경우
        alert('이메일 형식을 확인하세요');
        email.focus();
        return false;
    }

    // 취미 검증
    let count = 0;
    for(let i=0;i<hobby.length;i++){
        if(hobby[i].checked){
            count++;
        }
    }
    if(count == 0){   // count가 0이라면 하나도 체크를 안했다는 것.
        alert('취미는 적어도 1개 이상 선택하세요');
        return false;
    }

    // 주민등록번호 검증
    if(isSsn.value == 'n'){
        alert('주민등록번호 검증버튼을 눌러주세요')
        ssn1.focus();
        return false;
    }

    //우편번호 검증
    if(zipcode.value == ''){
        alert('우편번호를 입력하세요');
        zipcode.focus(); //포커스를 맞춰준다.
        return false;    // 더이상 진행이 되지 않도록 false를 리턴한다.
    }

    return true;

    // frm.submit();
}

function moveFocus(){
    const ssn1 = document.getElementById('ssn1');
    if(ssn1.value.length >= 6){
        document.getElementById('ssn2').focus();
    }
}

function ssnCheck(){
    const ssn1 = document.getElementById('ssn1');
    const ssn2 = document.getElementById('ssn2');
    const isSsn = document.getElementById('isSsn');

    if(ssn1.value == "" || ssn2.value ==""){
        alert('주민등록번호를 확인하세요');
        ssn1.focus();
        return false;
    }
    const ssn = ssn1.value + ssn2.value;    //
    const s1 = Number(ssn.substr(0,1)) * 2;
    const s2 = Number(ssn.substr(1,1)) * 3;
    const s3 = Number(ssn.substr(2,1)) * 4;
    const s4 = Number(ssn.substr(3,1)) * 5;
    const s5 = Number(ssn.substr(4,1)) * 6;
    const s6 = Number(ssn.substr(5,1)) * 7;
    const s7 = Number(ssn.substr(6,1)) * 8;
    const s8 = Number(ssn.substr(7,1)) * 9;
    const s9 = Number(ssn.substr(8,1)) * 2;
    const s10 = Number(ssn.substr(9,1)) * 3;
    const s11 = Number(ssn.substr(10,1)) * 4;
    const s12 = Number(ssn.substr(11,1)) * 5;
    const s13 = Number(ssn.substr(12,1));


    let result = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12;
    result = result %11;
    result = 11 - result;
    if(result >= 10) result = result % 10;
    if(result == s13){
        alert('유효한 주민등록번호입니다.');
        isSsn.value = 'y';
    }else{
        alert('유효하지 않은 주민등록번호입니다.');
    }
}

function ssnChange(){
    const isSsn = document.getElementById('isSsn');
    isSsn.value = 'n';
}