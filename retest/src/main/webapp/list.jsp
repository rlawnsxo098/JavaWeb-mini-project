<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.domain.datainfo.*" %>
<%
Vector<BoardDTO> docList = (Vector<BoardDTO>)application.getAttribute("docList");
	if(docList == null){
		docList = new Vector<BoardDTO>();
	}
	
	Collections.sort(docList);
	
	int pageNum = 1;
	String paramPageNum = request.getParameter("pageNum");
	if(paramPageNum != null){
		pageNum = Integer.parseInt(paramPageNum);
	}
	
	int size = docList.size();
	int perPage = 5;
	int pageCount = size / perPage;
	if((size % perPage) != 0){
		pageCount++;
	}
	
	int start = (pageNum - 1) * perPage;
	int end = start + perPage;
	if(end > size){
		end = size;
	}
	
	List<BoardDTO> list = docList.subList(start, end);
%>

<table id="docList">
	<caption> - 글목록 - </caption>
	<thead>
		<tr id="docListHeader">
			<th id="docNum">번호</th>
			<th id="docContents">제목</th>
			<th id="docWriter">작성자</th>
			<th id="docDate">작성일</th>
		</tr>
	</thead>
	<%
	if(size != 0){
	%>
	<tfoot>
		<tr>
			<td colspan="4">
				<%
				for(int i = 1; i <= pageCount; i++){
								if(i == pageNum){
				%>
					[<b><%=i%></b>] 
				<%
				} else {
				%>	
					[<a href="template.jsp?contentsPage=list&pageNum=<%=i%>"><%=i%></a>]
				<%
				}
							}
				%>
			</td>
		</tr>
	</tfoot>
	<%
	}
	%>
	<tbody>
		<%
		if(size == 0){
		%>
			<tr>
				<td colspan="4">no data</td>
			</tr>
		<%
		}else{
				for(int num = 0; num<list.size(); num++){				
				BoardDTO doc = list.get(num);
		%>
				<tr onclick="select(<%=doc.getNum()%>)">
				<td><%= doc.getNum() %></td>
				<td><%= doc.getTitle() %></td>
				<td><%= doc.getWriter() %></td>
				<td><%= doc.getDate() %></td>
			</tr>
			
		<%
				}
			}
		%>	
	</tbody>
</table>
	<div> 
		<br><br>
		<h3>게시글 검색</h3>
		아직 구현이 완료되지 않았습니다. (ㅠㅠ)
		<form>
			<fieldset>
				<legend>검색</legend>		
				<label>검색분류</label>
					<select name = "title">
						<option value = "title">제목</option>
						<option value = "writer">작성자</option>
					</select>
				<label>검색어</label>
					<input type = "text" name = "q" value = ""/>
					<input type = "submit" value = "검색"/>
			</fieldset>
		</form>
	</div>
	<br><br>
	
	<h3>네이버 정보 검색</h3>
	원하는 정보 검색시 초록창의 검색결과가 나타납니다! (새탭) <br>
	<section>
        <form action="https://search.naver.com/search.naver" target='_blank'>
            <div class="search">
                <input type="text" name="query" value="">
                <button type="submit">검색</button>
            </div>
        </form>
    </section>
    
<form id="hiddenForm" name="hiddenForm" action="showDetail.jsp">
	<input type="hidden" name="num" />
</form>
<script>

	function select(num){
		var myForm = document.hiddenForm;
		myForm.num.value = num;
		myForm.submit();
	}	

</script>