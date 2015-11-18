<cfcomponent>
		<cfset this.name = "Subash Test"/>

		<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

		<cfinclude template="includes/header.cfm">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

		<cffunction name="onRequestStart">
		<cfif isDefined("form.loginAction")>
				<cfset oBlog 	= createObject("subash_blog.cfcs.blog").init()>
				<cfset oBlog.login(username=form.username, password=form.password, action = form.loginAction)>
		</cfif>
		</cffunction>
</cfcomponent>