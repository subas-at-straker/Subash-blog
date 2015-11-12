<cfif NOT IsDefined("session.uid")>
	<cflocation url="login.cfm?error=Not Logged in!" addtoken="false">
<cfabort>
</cfif>