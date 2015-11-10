<cfinclude template="style.cfm">
<cfset oBlog = createObject("subash_test.cfcs.blog").init()>
<cfset qPost = oBlog.getPost(id=url.id)>

<html>
<head>
	<title>Subash Test</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap">
		<div class="page-header">
			<h1 class="text-center neon" style="font-size: 150px;">Content</h1></br>
		</div>
		<div  style="background-color: #99CCFF;padding:10px;">
			<cfoutput>#qPost.post_content#</cfoutput>
		</div>
		<a href="index.cfm"><br/>Go Back</a>
		</div>
	</div>
</body>
</html>