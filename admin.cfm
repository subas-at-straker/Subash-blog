<cfinclude template="style.cfm">
<cfset oBlog 	= createObject("subash_test.cfcs.blog").init()>
<cfset qPosts	= oBlog.getPosts()>

<html>
<head>
	<title>Subash Test</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap">
		<div class="page-header">
			<h1 class="text-center neon" style="color:Red;font-size: 150px; ">Admin</h1></br>
		</div>
		<h3 class="list-group-item active">Click to edit:</h3>
		<cfoutput query="qPosts">
			<ul class="list-unstyled">
				<li>
					<h3 class="list-group-item" style="padding-top:0px;">
						<a href="edit.cfm?id=#qPosts.id#" class="list-group-ite" ><br>#qPosts.currentrow#. #qPosts.post_title#</a>
					</h3>
				</li>
			</ul>
		</cfoutput>
		<a href="index.cfm"><br/>Go Back</a>
		</div>
	</div>
</body>
</html>