<cfcomponent>
		<cfset this.name = "Subash Test"/>
		<cfset this.applicationTimeout = createTimeSpan( 0, 0, 5, 0 ) />
		<cfset this.sessionManagement = true />
		<cfset this.sessiontimeout = createTimeSpan( 0, 0, 2, 0) />

		<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

		<cfinclude template="includes/header.cfm">

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

		<cffunction name="onRequestStart">
		<cfif isDefined("form.loginAction")>
				<cfset oBlog 	= createObject("subash_test.cfcs.blog").init()>
				<cfset oBlog.login(username=form.username, password=form.password, action = form.loginAction)>
		</cfif>
		</cffunction>
</cfcomponent>