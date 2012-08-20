<h1>Select a Query</h1>
<cfoutput>
<a href="#event.buildLink(linkto='car/test1')#">Simple Join</a><br />
<a href="#event.buildLink(linkto='car/test2')#">Simple Join with Result Transformer</a><br />
<a href="#event.buildLink(linkto='car/test3')#">SQL Restriction</a><br />
<a href="#event.buildLink(linkto='car/test4')#">Subquery</a><br />
</cfoutput>