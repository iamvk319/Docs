<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<!doctype html>
<html>
<head>
<style>
.action-status {
	pointer-events: none;
}

.footerBut {
	text-align: center;
}
</style>
<link rel="stylesheet" href="../css/salAcc.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>Salary Account</title>
</head>
<body>
	<script type="text/javascript" src="../js/salAccApp.js"></script>
	<div class="container">
		<header class="header bg-wine">
			<h1>Salary Account Applications</h1>
		</header>
		<s:form action="savedt" method="post" theme="simple" onsubmit='return saveStatusSetup()'>
			<table>
				<thead class="bg-wine">
					<tr>
						<th>Select</th>
						<th>Tracking No.</th>
						<th>Customer Name</th>
						<th>Mobile</th>
						<th>DOB</th>
						<th>Communication Address</th>
						<th>Action</th>
					</tr>
				</thead>
				<s:iterator value="expTbRespList" var="ExpTbUserDetails"
					status="list">
					<tr id="row_%{#list.index}">
						<td><input type="checkbox" class='checkBox' /></td>
						<%-- <td><s:checkbox name="#ExpTbUserDetails.trackerId" fieldValue="false" class='checkBox'/></td> --%>
						<td><s:property value="#ExpTbUserDetails.trackerId" /></td>
						<td><s:property value="#ExpTbUserDetails.firstName" />
						<s:property value="#ExpTbUserDetails.lastName"/></td>
						<td><s:property value="#ExpTbUserDetails.mobile" /></td>
						<td><s:property value="#ExpTbUserDetails.dob" /></td>
						<td><s:property value="#ExpTbUserDetails.cooAddress" /></td>

						<td class='action-status'><s:radio
								list="#{#ExpTbUserDetails.trackerId+'-A':'Approve',#ExpTbUserDetails.trackerId+'-R':'Reject'}"
								name="expTbRespList[%{#list.index}].trackerId"
								id="%{ExpTbUserDetails.trackerId}" theme="simple"></s:radio></td>
					</tr>
				</s:iterator>
			</table>
			<div id="dataStatus" class="msgBlock"></div>
			<%-- <div class="auth">
				<b>Email id of Authorized Signatory</b> <input type="email"
					class="email" id="emailId" disabled
					value="<s:property value="#ExpTbUserDetails.emailAuth"/>" />
			</div>
			 --%>
			
			<div class="auth">
				<b>Email id of Authorized Signatory</b> 
				<s:select label="Email id of Authorized Signatory" class="email-auth"
						headerKey="-1" headerValue="Select Email id of Authorized Signatory"
						list="#ExpTbUserDetails.emailAuth" 
						name="email" />
			</div>
			<s:hidden name="tid" value="%{#ExpTbUserDetails.trackerId}" />
			<div class="footerBut">
				<s:submit class="bg-wine" id="submitAcc" cssStyle="color: white" disabled="false" />
				<button class="bg-wine" type="button" onclick="close_window(); return true;"  style="color: white" >Close</button>
			</div>



		</s:form>
	</div>
	<script>
	$(document).ready(function() {
	    function disableBack() { window.history.forward() }

	    window.onload = disableBack();
	    window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
	});
	$(".checkBox").click(
			function() {
				console.log($(this))
				if ($(this).prop("checked")) {
					$(this).parent().parent().find('.action-status').css(
							'pointer-events', 'auto');
				} else {
					this.checked = false;
					$(this).parent().parent().find('.action-status input')
							.prop('checked', false);
					$(this).parent().parent().find('.action-status').css(
							'pointer-events', 'none');
				}
			});
	
	function saveStatusSetup()
	{
		var result = false;
		var isAnyCaseSelected = false;
		var arr = $('.checkBox');
					$.each(arr, function( index, value ) {
						if($(value).prop('checked')){
							isAnyCaseSelected = true;
							//var arr = $('.action-status')
							
							var arrInnerElement = $("[name='expTbRespList["+index+"].trackerId']");
							var ActionSelected = false;
		                    $.each(arrInnerElement, function( i, v ) {
		                            if($(v).prop('checked')){
										 result = true;
										ActionSelected = true }
		                    });
							if(!ActionSelected){
									result = false;
								}

		                }
					});
		if(!isAnyCaseSelected){ alert('Please Select At Least One Case'); }
		else if(!result){ alert('Please select any Action');}
		else if(result){
						if($(".email-auth")[0].value == "-1" ){
							alert('Please Select At Least One EmailId from the list'); 
							result = false;
						}
						else{ result = true; }
					}
		
		return result;
		
	}
		/* $(document).ready(function() {
		    function disableBack() { window.history.forward() }
	
		    window.onload = disableBack();
		    window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
		});
		$(".checkBox").click(
				function() {
					console.log($(this))
					if ($(this).prop("checked")) {
						$(this).parent().parent().find('.action-status').css(
								'pointer-events', 'auto');
					} else {
						this.checked = false;
						$(this).parent().parent().find('.action-status input')
								.prop('checked', false);
						$(this).parent().parent().find('.action-status').css(
								'pointer-events', 'none');
					}
				});
		
		function saveStatusSetup()
		{
			var result = false;
			var arr = $('.action-status')
			$.each(arr, function( index, value ) {
				var value = $(value).find('input');
				$.each(value, function( i, v ) {
					if($(v).prop('checked')){ result = true; }
				});
			});
			if(!result){ alert('Please Select At Least One Case'); }
			return result;
			
		} */
		
	</script>
</body>
</html>