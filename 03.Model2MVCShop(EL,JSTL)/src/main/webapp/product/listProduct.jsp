<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ page import="com.model2.mvc.service.domain.*" %> --%>
<%-- <%@ page import="com.model2.mvc.common.Search" %> --%>
<%-- <%@page import="com.model2.mvc.common.Page"%> --%>
<%-- <%@page import="com.model2.mvc.common.util.CommonUtil"%> --%>

<%-- <% --%>
<!-- // HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute("map"); -->
<!-- // List<Product> list= (List<Product>)request.getAttribute("list"); -->
<!-- // Page resultPage=(Page)request.getAttribute("resultPage"); -->

<!-- // Search search = (Search)request.getAttribute("search"); -->
<!-- // //==> null �� ""(nullString)���� ���� -->
<!-- // String searchCondition = CommonUtil.null2str(search.getSearchCondition()); -->
<!-- // String searchKeyword = CommonUtil.null2str(search.getSearchKeyword()); -->

<!-- //   String role = (String)session.getAttribute("menuType"); -->
<%-- %> --%>

<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	 function fncGetProductList(currentPage){
	 	document.getElementById("currentPage").value = currentPage;
	 	document.detailForm.submit();
	 }
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listProduct.do" method="post">
<!-- �Ʒ��� �Ǹ� ��ǰ ���� or ��ǰ�˻� ������ �κ��� table -->
			<table  border : 1px solid black;
  border-collapse : collapse width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37">
					<img src="/images/ct_ttl_img01.gif" width="15" height="37" />
					</td>
					<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
					
							<tr>
								<c:if test='${menu ==("manage") } '>

									<td width="93%" class="ct_ttl01">�Ǹ� ��ǰ ����</td>
								</c:if>

								<c:if test='${menu ==("search") } '>
									<td width="93%" class="ct_ttl01">��ǰ �˻�</td>
								</c:if>

							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>

<!-- �Ʒ��� ��ǰ �˻��� ������ table -->
			<table  border : 1px solid black;
  border-collapse : collapse width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0"
								${ (search.searchCondition== 0) ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${ (search.searchCondition== 1) ? "selected" : ""}>��ǰ��</option>
							<option value="2"
								${ (search.searchCondition==2) ? "selected" : ""}>��ǰ����</option>
					</select> <input type="text" name="searchKeyword"
						value="${search.searchKeyword }" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetProductList(1);">�˻�</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

<!-- �Ʒ��� ��ǰ��ȣ , ��ǰ�� �� ��ǰ�� ���õ� table -->
			<table  width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ����
						${resultPage.currentPage } ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">��ǰ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}" varStatus="">
					<c:set var="i" value="${ i+1 }" />
		
		
		<tr class="ct_list_pop">
						<td align="center">${ i }</td>
						<td></td>
						<td>${product.prodNo}</td>			
							<td></td>
						<td align="center">
						<c:if test="${not empty product}">
							<c:choose>
								<c:when test="${user.role == 'admin' && menu == 'manage'}">
									<a href="/updateProductView.do?prodNo=${product.prodNo}">${product.prodName}</a>
								</c:when>
								<c:otherwise>
									<a href="/getProduct.do?prodNo=${product.prodNo }">${product.prodName}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
						 <c:if test="${empty user}">
							<a href="/getProduct.do?prodNo=${product.prodNo }">${product.prodName}</a>
						</c:if>
						</td>
						
						<td></td>		
						<td align="left">${product.price}</td>
						<td></td>
						<td align="left">${product.regDate}</td>
						
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>

			</table>

			<!-- PageNavigation Start... -->
			<table  width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
	<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			�� ����
	</c:if>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
			<a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">�� ����</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			���� ��
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">���� ��</a>
	</c:if>
			<!--  ������ Navigator �� -->

		</form>

	</div>
</body>
</html>