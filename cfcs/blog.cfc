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

	</cfcomponent>