<cfset oBlog 	= createObject("subash_blog.cfcs.blog").init()>
<cfoutput>#oBlog.logout()#</cfoutput>
<html>
<head>
	<title>Subash Test</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap">
		<div class="page-header">
			<h1 class="text-center neon" style="color:green;font-size: 30px; ">Logged out successfully!!!</h1></br>
		</div>
		<h3 class="list-group-item active">Want to login again?</h3><br/>
		<a href="login.cfm" class="btn btn-default">Login</a>
		</div>
	</div>
</body>
</html>