<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../header.jsp"/>
<div align="center">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	 	 <h1> 비밀번호 확인 </h1>
    
         <label for="passwd">PASSWD:</label>
        <input type="password" id="passwd" name="passwd" > <br>
        
        <button onclick="passwdCheck()"> 확인 </button>
        
	</form>
	
	<script>
	  	let ck = false;
        function passwdCheck() {
            let passwd = $("#passwd").val();
             if (passwd == ""){
            	 alert("비밀번호를 입력해주세요")
            	 $("#passwd").focus();
            	 return;
             }
             var csrfToken = $("meta[name='_csrf']").attr("content");
     	    var csrfHeader = $("meta[name='_csrf_header']").attr("content");  
     	    $.ajax({
     	    	url : "passwdCheck.ajax",
     	    	type : "post",
     	    	data : {
     	    			"passwd" : passwd,
     	    			"_csrf": csrfToken
     	    	},
     	    	beforeSend: function(xhr) {
                    // AJAX 요청 헤더에 CSRF 토큰 추가
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success : function(res) {
    				if (res == "OK") {
    					alert("비밀번호 일치, 회원수정페이지로 넘어갑니다.")
    					ck = true;
    				} else {
    					alert("비밀번호 불일치. 비밀번호를 다시 입력해주세요")
    					$("#passwd").val("");
    					$("#passwd").focus();
    					ck = false;
    				}
    			},
    			error : function(err) {
    				console.log(err);
    				ck = false;
    			}
     	    })
        }

       
        
        
       
    	
    
    	
    	
    	
    </script>
	
</div>
<jsp:include page="../footer.jsp"/>
onclick="location.href='/customer/updateForm.do'"
