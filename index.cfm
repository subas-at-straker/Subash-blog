<cfinclude template="includes/login_helpers.cfm">
<cfset oBlog 	= createObject("subash_blog.cfcs.blog").init()>
<cfset qPosts	= oBlog.getPosts()>

<html>
<head>
	<title>Blog</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap">
		<a href="logout.cfm"><h4><button type="button" class="btn btn-danger" style="float: right;">Logout</button></h4></a>
		<div class="page-header">
			<h1 class="text-center neon" style="font-size: 150px; color:Orange;"><strong>B</strong><sup>log</sup><small style="font-size:20px;">Express Yourself</small> </h1>
			</br>
		</div>

		<h3 class="list-group-item active">Blog Entries</h3>
		<cfoutput query="qPosts">
			<ul class="list-unstyled">
				<li>
					<h3 class="list-group-item" style="padding-top:0px;">
						<a href="post.cfm?id=#qPosts.id#" class="list-group-ite" ><br>#qPosts.currentrow#. #qPosts.post_title#</a>
					</h3>
				</li>
			</ul>
		</cfoutput>
		</div>
	</div>
	<cfoutput>
</cfoutput>
</body>
</html>