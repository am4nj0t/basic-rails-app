<div class="row">
	<div class="col-md-8">
		<h1>Popular</h1>
		<p class="lead">Active posts this week</p>
		<%= render @posts %>
		<%= will_paginate @posts %>
	</div>
	<div class="col-md-4">
	</div>
</div>		