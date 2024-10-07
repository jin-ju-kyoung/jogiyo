<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page="../header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
   
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .order-table-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin: auto;
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .order-table th, .order-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dddddd;
            text-align: center;
        }
        .order-table th {
            background-color: #f2f2f2;
        }
        .actions button {
            padding: 8px 10px;
            background-color: #fa006c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 90px;
        }
        .actions button:disabled {
            background-color: #cccccc;
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-header h2 {
            margin: 0;
            font-size: 20px;
        }
        .order-header span {
            font-size: 14px;
            color:#fa006c;
        }
         table{
	 	border-collapse: collapse;
	 	width: 100%;
	 }
	 .table_text_align_center{
				text-align: center;
	 }	
	 caption{
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    line-height: 0;
	    overflow: hidden; 
	 }	  


		 th{
		text-align: center;
	    color: #333;
	    border-bottom: 1px solid #e7e7e7;
	  
	    background: #f4f9fd;
	    padding: 2px 0;	 
		 }
		.td_width_1{
		text-align: center;
			width: 5%;
		}	 	 	 
		.td_width_2{
		text-align: center;
			width: 10%;
		}	 	 
		.td_width_3{
		text-align: center;
			width: 25%;
		}	 
		.td_width_4{
		text-align: center;
			width: 15%;
		}	
		
	 
        
    </style>
    
    <div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<table class="order-table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table >
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${basket}" var="ba">
							<tr>
								<td class="td_width_1"></td>
								<td class="td_width_2">${ba.img}</td>
								<td class="td_width_3">${ba.menuname}</td>
								<td class="td_width_4 price_td">
									
									<span class="red_color"><fmt:formatNumber value="${ba.price}" pattern="##,### 원" /></span><br>
									
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ba.qty}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4"><span class="red_color"><fmt:formatNumber value="${ba.totprice}" pattern="##,### 원" /></span><br></td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			
			
			<!--  
			
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>권</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="content_btn_section">
				<a>주문하기</a>
			</div>
			-->
        <table class="order-table">
            
            <tbody>
               <tr>
	                    
                    <td>
                <c:forEach items="${blist}" var="list">
	                   <p>${list.menuname} 
                    		<button onclick="deleteOrder()">삭제</button>
                    	
                    </p> 
                </c:forEach>
                    
	                    </td>
    
 
       
        
            
            <tbody>
               <tr>
	                    
                    
                    <td >
                          <button id="kaobtn" style="background:#fee500; color:#000; border-radius:12px; padding: 10px 20px;">카카오페이</button>

                    </td>
                   <td class="actions">
                        <button onclick="">메뉴추가</button>
                    </td>
                </tr>
                
                   

              


                 
            </tbody>
        </table>
   
      <script>
/*       document.addEventListener('DOMContentLoaded', function() {
    	   const selectedNames = JSON.parse(localStorage.getItem('selectedNames'));
    	   const resultElement = document.getElementById('result');
    	   resultElement.innerText = selectedNames.join('\n');
    	});
       */
        function order() {
            alert('주문 기능을 구현하세요.');
        }

        function deleteOrder() {
            alert('삭제 기능을 구현하세요.');
        }
        
        
        $(document).ready(function() {
            $('#kaobtn').click(function() {
                /*
                @ data화면에서 입력받을 수 있는 기본 결제 정보만 넘겨주기 (나머진 뒤에서)
                @ return 카카오톡 결제요청 페이지
                */
                $.ajax({
                    type: 'POST',
                    url: '/api/kakaopay',
                    contentType: 'application/json',

                    
                    data: {
                        item_name: "불고기버거",
                        quantity: "1",  // 콜론을 사용하여 값을 할당합니다.
                        total_amount: "2200",
                        tax_free_amount: "0"
                    },
                    success: function(res) {
                  	  if (res.next_redirect_pc_url) {
                            location.href = res.next_redirect_pc_url;
                        } else {
                            console.error("응답에 next_redirect_pc_url이 없습니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("AJAX 요청 실패:", status, error);
                        console.log(xhr.responseText);  // 서버 응답 메시지 출력
                    }
                });
            });
      
        });
       
        
    </script>

   
</body>
</html>

<jsp:include page="../footer.jsp"/>

