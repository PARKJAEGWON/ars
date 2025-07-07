// 주소 검색
function searchAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById('address1').value = data.address;
            document.getElementById('address2').focus();
        }
    }).open();
}

// 주문자 정보 동일 처리
function toggleAddressByOrderer() {
    const checked = document.getElementById('sameAsOrderer').checked;
    const member = {
        name: memberName,
        phone: memberPhone,
        zip: memberZipCode,
        addr1: memberAddress1,
        addr2: memberAddress2
    };
    document.getElementById('receiverName').value = checked ? member.name : '';
    document.getElementById('receiverPhone').value = checked ? member.phone : '';
    document.getElementById('zipCode').value = checked ? member.zip : '';
    document.getElementById('address1').value = checked ? member.addr1 : '';
    document.getElementById('address2').value = checked ? member.addr2 : '';
    document.getElementById('receiverName').readOnly = checked;
    document.getElementById('receiverPhone').readOnly = checked;
    document.getElementById('zipCode').readOnly = checked;
    document.getElementById('address1').readOnly = checked;
    document.getElementById('address2').readOnly = checked;
}

// 무통장입금 정보 표시/숨김
function toggleBankInfo() {
    const bankRadio = document.getElementById('payBank');
    const bankInfoArea = document.getElementById('bankInfoArea');
    if (bankRadio.checked) {
        bankInfoArea.style.display = 'block';
    } else {
        bankInfoArea.style.display = 'none';
    }
}

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    // 전체 동의 체크박스
    document.getElementById('agreeAll').addEventListener('change', function() {
        document.getElementById('agree1').checked = this.checked;
        document.getElementById('agree2').checked = this.checked;
    });

    // 배송정보 초기화
    document.getElementById('sameAsOrderer').checked = false;
    toggleAddressByOrderer();

    // 결제 방법 이벤트 리스너
    document.getElementById('payBank').addEventListener('change', toggleBankInfo);
    document.getElementById('payCard').addEventListener('change', toggleBankInfo);
    toggleBankInfo();
}); 