<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
 <jsp:include page="/html/Layout.jsp"></jsp:include>  

<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../js/newFile_Popup.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_student.css">
<head>
</head>
	<body>

		<div class="content_body">
			<div class="left">
				<ul>
					<li><a href="#">Livrable 1</a></li>
					<li><a href="#">Livrable 2</a></li>
					<li><a href="#">Livrable 3</a></li>
				</ul>
			</div >
			<div class="centerAndRight">
				<div class="center">
					<h2>You select livrable 1</h2>
					<h3>Files your group upload :</h3>		
			
					<button id="file-button" >Click me</button>
				
					<div id="pageFiles">
						<div class="filescontent" id="attachFiles">
							<div class="table" id="attachTable">
								<table class="table" width="100%" cellspacing="0" cellpadding="0" border="0">
								<colgroup>
									<col width="16">
									<col width="16">
									<col width="">
									<col width="80">
									<col width="145">
									<col width="115">
									<col width="75">
								</colgroup>
								<tbody>
									<tr>
										<th class="col1" colspan="3">File</th>
										<th class="col4">Size</th>
										<th class="col5">Date</th>
										<th class="col6">Attached by</th>
										<th class="col7">Option</th>
									</tr>
									<tr class="bg1" id="deki-file-row-673">
										<td class="col1">&nbsp;</td>
										<td class="col2">
											<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">
												<span class="icon">
													<img src="/skins/common/icons/icon-trans.gif" class="mt-ext-docx" alt="">
												</span>
											</a>
										</td>
										<td class="col3">
											<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">1.docx</a>
											<div>
												<span id="" class="deki-file-description desctext nodescription">No description</span>
											</div>
										</td>
										<td class="col4">11.3 kB</td>
										<td class="col5">01:42, 14 Aug 2014</td>
										<td class="col6">
											<a href="/User:Esraa_Hussen" class="link-user" rel="internal">Esraa_Hussen</a>
										</td>
										<td class="col7" >
											<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">
												<span class="icon">
													<img src="/skins/common/icons/icon-trans.gif" class="mt-ext-docx" alt="">
												</span>
											</a>
										</td>
										<tr class="bg2" id="deki-file-row-673">
									<td class="col1">&nbsp;</td>
									<td class="col2">
										<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">
											<span class="icon">
												<img src="/skins/common/icons/icon-trans.gif" class="mt-ext-docx" alt="">
											</span>
										</a>
									</td>
									<td class="col3">
										<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">1.docx</a>
										<div>
											<span id="" class="deki-file-description desctext nodescription">No description</span>
										</div>
									</td>
									<td class="col4">11.3 kB</td>
									<td class="col5">01:42, 14 Aug 2014</td>
									<td class="col6">
										<a href="/User:Esraa_Hussen" class="link-user" rel="internal">Esraa_Hussen</a>
									</td>
									<td class="col7" >
										<a href="http://wiki.efrontlearning.net/@api/deki/files/673/=1.docx" class="filelink" title="1.docx">
											<span class="icon">
												<img src="/skins/common/icons/icon-trans.gif" class="mt-ext-docx" alt="">
											</span>
										</a>
									</td>
									</tr>
							</div>		
						</div>	
			</div>	
		</div>
		<div id="popup" style="left: 390px; position: absolute; top: 1823px; z-index: 9999; display: block; opacity: 1;">
	        <span class="button b-close"><span>X</span></span>
	      
	        <form method="post" action="/TP1/bean.jsp">
				<label for ="lastname"> Last name </label>
				<br/><Input type="file" name="insert"/> 
			    <br/><label for ="first"> First name </label>
			    <br/><Input type="text" name="firstname"/>
			    <br/><label for ="birth"> birth </label>
			    <br/><Input type="date" name="birth">  
			   
			    <br/><Input type="submit" >
			</form>
		</div>	
    	</div>
	</body>
</html>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>