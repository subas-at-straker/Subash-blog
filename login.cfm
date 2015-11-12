<html>
<head>
	<title>Login</title>
</head>
<body>
	<div class="container-fluid">
		<div id="wrap"  style="width:40%">
			<div class="page-header">
				<h1 class="text-center neon" style="font-size: 150px; color:Orange;"><strong>B</strong><sup>log</sup><small style="font-size:20px;">Express Yourself</small> </h1>
				</br>
			</div>
			<cfoutput>
			<div id="login">
				<form id="login" method="post" validate>
					<div class="form-group" >
						<label for="username">
							<b>Username:</b>
						</label><br/>
						<input type="text" class="form-control" name="username" required="yes"></input>
					</div>
					<div class="form-group">
						<label for="password">
							<b>Password:</b>
						</label><br/>
					<input type="password" class="form-control" name="password" required="yes"></input><br/>
					<cfif isdefined("url.error")>
						<span class = "label label-danger">#url.error#</span>
					</cfif>
					<div style="text-align: center;">
						<input type="submit" class="btn btn-primary" value="Login"></input>
						<input type="hidden" name="loginAction" value="login"/>
					</div>
				</form>
			</cfoutput>
			</div>
		</div>
</body>
</html>