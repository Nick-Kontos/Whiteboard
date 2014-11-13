
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<g:if test="${controllertype == 'Announcement' }">
					<li><g:link controller="Announcement" action="allLink">All</g:link></li>
					<li><g:link controller="Announcement" action="generalLink">General</g:link></li>
				</g:if>
				<g:elseif test="${controllertype == 'Assignment' }">
					
				</g:elseif>
				<g:elseif test="${controllertype == 'Account' }">
					
				</g:elseif>
				<g:elseif test="${controllertype == 'Course' }">
					
				</g:elseif>
				<g:elseif test="${controllertype == 'Grade' }">
					
				</g:elseif>
				<g:each in="${sidebarlinks}">
					<li><g:link controller="Announcement" action="courseLink" params="[coursename:'${it }']">${it }</g:link></li>
				</g:each>
			</ul>
		</div>
	</div>
</div>