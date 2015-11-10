<cfinclude template="style.cfm">
<cfparam name="sMessage" default="">
<cfset oBlog = createObject("subash_test.cfcs.blog").init()>

<cfif isdefined("url.save")>
	<cfset oBlog.editPost(id=url.id, content=url.content)>
	<cfset sMessage = "Post updated !!!">
</cfif>

<cfset qPost = oBlog.getPost(id=url.id)>

<cfoutput>
<html>
<head>
	<title>Edit</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap">
			<div class="page-header">
				<h1 class="text-center neon" style="font-size: 150px;">Edit</h1></br>
			</div>
			<div  style="background-color: ##99CCFF; padding:10px;">
				<form name="saveForm">
					<textarea rows="10" cols="70" name="content">#qPost.post_content#</textarea><br/>
					<button type="submit" class="btn btn-default" name="save">Save</button>
					<input type="hidden" name="id" value="#url.id#"/>
				</form>
				<cfif len(trim(sMessage))>
					<cfoutput><span class = "label label-success">#sMessage#</span></cfoutput>
				</cfif>
			</div>
		<a href="admin.cfm"><br/>Go Back</a>
		</div>

	</div>
</body>
</html>
</cfoutput>

<!--- request.attributes does not work --->
<!--- <cfif structKeyExists(request.attributes, "save")>
	<cfset oBlog.editPost(id=url.id, content=url.content)>
	<cfset sMessage = "Post update">
</cfif> --->
<!--- Form doesnt work --->
<!--- <cfif isdefined("form.save")>
	<cfset editPost(id=form.id, content=form.content)>
	<cfset sMessage = "Post update">
</cfif> --->
