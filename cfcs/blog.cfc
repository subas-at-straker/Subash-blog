<cfcomponent>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfreturn this>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="getPosts" returnType="query" access="public" output="false" hint="I return blog posts">
		<cfargument name="dsn" type="string" required="false" default="subash_blog" hint="I am the dsn" displayname="dsn" />

		<cfset var qReturn = "">

		<cfquery name="qReturn" datasource="#arguments.dsn#">
			select id, post_title, post_content
			from tbl_posts
			ORDER BY created DESC
		</cfquery>
		<cfreturn qReturn>

	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="getPost" returnType="query" access="public" output="false" hint="I return blog posts">
		<cfargument name="id" 		type="numeric" required="true" hint="I am the id of the post" displayname="id" />
		<cfargument name="dsn" type="string" required="false" default="subash_blog" hint="I am the dsn" displayname="dsn" />

		<cfset var qReturn = "">

		<cfquery name="qReturn" datasource="#arguments.dsn#">
			select 		*
			from 		tbl_posts
			WHERE 		id 				= <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>

		<cfreturn qReturn>

	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="editPost" returnType="boolean" hint="I edit a post">
		<cfargument name="id" 		type="numeric" required="true" hint="I am the id of the post" displayname="id" />
		<cfargument name="content" 	type="string" required="true" hint="I am the content to be updated" displayname="content" />
		<cfargument name="dsn" 		type="string" required="false" default="subash_blog" hint="I am the dsn" displayname="dsn" />

		<cfset var qUpdatePost = "">

		<cfquery name="qUpdatePost" datasource="#arguments.dsn#">
			Update 		tbl_posts
			set 		post_content 	= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.content#">
			WHERE 		id 				= <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">
		</cfquery>

		<cfreturn true>

	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="logout" hint="I logout!">
		<cfloop collection=#session# item="i">

			<cfset StructDelete(session,i)>

		</cfloop>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="login" hint="I check login!">
		<cfargument name="username" type="string" required="true" hint="I am username" displayname="username" />
		<cfargument name="password" type="string" required="true"hint="I am password" displayname="password" />
		<cfargument name="action" type="string" required="true" hint="I am form action" displayname="action" />
		<cfargument name="dsn" type="string" required="false" default="subash_blog" hint="I am the dsn" displayname="dsn" />

			<cfset var qlogin = "">
			<cfif arguments.action EQ "login">
				<cfquery datasource="#arguments.dsn#" name="qLogin">
					SELECT id, username, password, role
					FROM users
					WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.username#"> AND password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.password#">;
				</cfquery>

				<cfif qLogin.RecordCount Greater THAN 0>
					<cfset session.uid = qLogin.id>
					<cfif qLogin.role EQ "admin">
						<cflocation url="admin/admin.cfm" addtoken="false">
					<cfelse>
						<cflocation url="index.cfm" addtoken="false">
					</cfif>
				<cfelse>
					<cflocation url="login.cfm?error=Authorization Failed!" addtoken="false">
				</cfif>
			<cfelse>
					<cflocation url="login.cfm?error=Oops something went wrong. Try Again!" addtoken="false">
			</cfif>
	</cffunction>
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	</cfcomponent>
