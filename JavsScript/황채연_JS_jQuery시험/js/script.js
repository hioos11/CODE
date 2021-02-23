function sendit(){

    // 객체 생성
    const email = document.getElementById('email_lbl');
    const email2 = document.getElementById('email2_lbl');
    const name = document.getElementById('name_lbl');
    const userpw = document.getElementById('pwd_lbl');
    const userpw_re = document.getElementById('pwd2_lbl');
    const hp = document.getElementById('phone_lbl');
    const ssn = document.getElementById('ssn_lbl');
    const agree = document.getElementById('agree_lbl');
    const content = document.getElementById('content_lbl');

    // 정규식
    const expEmailText = /^[A-Za-z0-9]+$/; 
    const expNameText = /[가-힣]+$/;
    const expHpText = /^\d{10,11}$/;

    // 이메일
    // 1. 이메일 체크
    if(email.value == ''){
        alert('이메일을 입력하세요.');
        email.focus();
        return false;
    }
    // 1. 첫번째 항목에 특수문자가 입력되지 않음
    if(!expEmailText.test(email.value)){
        alert('이메일에는 특수문자가 입력될 수 없습니다.');
        email.focus();
        return false;
    }
    if(email2.value == ''){
        alert('이메일 도메인을 입력하세요.');
        email2.focus();
        return false;
    }

    // 이름
    // 2. 이름 체크
    if(name.value == ''){
        alert('이름을 입력하세요.');
        name.focus();
        return false;
    }
    if(!expNameText.test(name.value)){
        alert('이름은 한글만 입력 가능합니다.');
        name.focus();
        return false;
    }

    // 비밀번호
    // 3. 비밀번호 체크
    if(userpw.value == ''){
        alert('비밀번호를 입력하세요.');
        userpw.focus();
        return false;
    }
    
    // 3. 영문, 숫자, 특수문자가 적어도 1자이상 포함되도록
    const num = userpw.value.search(/[0-9]/g);
    const eng = userpw.value.search(/[a-z]/ig);
    const spe = userpw.value.search(/[`~!@#$%^&*()|\₩\'\";:\/?,.<>=_+\-]/gi);

    if(num < 0){
        alert('비밀번호는 숫자를 포함해야 합니다.');
        return false;
    }
    if(eng < 0){
        alert('비밀번호는 영어를 포함해야 합니다.');
        return false;
    }
    if(spe < 0){
        alert('비밀번호는 특수문자를 포함해야 합니다.');
        return false;
    }
    
    // 3. 8자이상 20자이하로 입력되도록
    if(userpw.value.length < 8 || userpw.value.length > 20){
        alert('비밀번호는 8자 이상 20자 이하입니다.');
        return false;
    }

    // 3. 비밀번호와 비밀번호 확인이 일치하도록
    if(userpw.value != userpw_re.value){
        alert('비밀번호와 확인이 일치하지 않습니다.');
        userpw_re.focus();
        return false;
    }

    // 4. 연락처 체크
    if(hp.value == ''){
        alert('연락처를 입력해 주세요.');
        hp.focus();
        return false;
    }
    if(!expHpText.test(hp.value)){
        alert('연락처는 숫자만 입력 가능합니다.\n형식에 맞게 입력해 주세요.');
        hp.focus();
        return false;
    }

    // 5. 주민등록번호
    if(ssn.value == ''){
        alert('주민등록번호를 입력해 주세요.');
        ssn.focus();
        return false;
    }
    if(isSsn.value == 'n'){
        alert('주민등록번호 검증버튼을 눌러주세요')
        ssn1.focus();
        return false;
    }
    // 8. 개인정보 활용 동의
    if(agree.checked == false){
        alert('개인정보 활용에 동의해 주세요.')
        return false;
    }

    // 9. 문의 내용 200자를 넘지 못하도록
    if(content.value == ''){
        alert('문의 내용을 입력해 주세요.');
        return false;
    }
    if(content.value.length > 200){
        alert('문의 내용은 200자를 넘을 수 없습니다.');
        return false;
    }
    return true;
}
// 1. 이메일 '직접입력'에서 도메인을 고를 경우 자동으로 두번째 항목에 값이 포함
function selectEmail(){
    const sel_email = document.getElementById('select_email');
    const emailIdx = document.getElementById("select_email").options.selectedIndex;
    const email2 = document.getElementById('email2_lbl');
    if(emailIdx == 0){
        email2.value = "";
        email2.focus();
    }else{
        email2.value = sel_email.options[emailIdx].value + '.com';
    }
}

// 5. 검증버튼 -> 6. 성별, 7. 생년월일
function ssnCheck(){
    const ssn = document.getElementById('ssn_lbl').value;
    const isSsn = document.getElementById('isSsn');
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
    result = result % 11;
    result = 11 - result;
    if(result >= 10) result = result % 10;
    if(result == s13){
        alert('유효한 주민등록번호입니다.');
        isSsn.value = 'y';
    }else{
        alert('유효하지 않은 주민등록번호입니다.');
    }
    
    // 성별
    const gender = Number(ssn.substr(6,1));
    if(gender == 1 || gender == 3){
        document.getElementById('mmm_lbl').checked = true;
    }else if(gender == 2 || gender == 4){
        document.getElementById('www_lbl').checked = true;
    }


    // 생년월일
    const year = Number(ssn.substr(0,2));
    const month = Number(ssn.substr(2,2));
    const day = Number(ssn.substr(4,2));

    const select_year = document.getElementById('birth_year');
    const select_month = document.getElementById('birth_month');
    const select_day = document.getElementById('birth_day');

    for(let i=1900;i<=2021;i++){
        const opt = document.createElement('option');
        opt.setAttribute('value',i);
        opt.innerText = i;
        select_year.appendChild(opt);
    }
    for(let i=1;i<=12;i++){
        const opt = document.createElement('option');
        opt.setAttribute('value',i);
        opt.innerText = i;
        select_month.appendChild(opt);
    }
    for(let i=1;i<=31;i++){
        const opt = document.createElement('option');
        opt.setAttribute('value',i);
        opt.innerText = i;
        select_day.appendChild(opt);
    }
    if(gender == 3 || gender == 4){
        select_year.options[year+101].selected = true;
    }else{
        select_year.options[year+1].selected = true;
    }
    select_month.options[month].selected = true;
    select_day.options[day].selected = true;

}
let cnt = 0;
function addFile(){
    const pTag = document.createElement('p');
    const input = document.createElement('input');
    const file_list = document.getElementById('file_list');
    cnt = cnt+1;
    input.type = "file";
    input.id = "fileIdx"+(cnt);
    pTag.appendChild(input);
    file_list.appendChild(pTag);
}