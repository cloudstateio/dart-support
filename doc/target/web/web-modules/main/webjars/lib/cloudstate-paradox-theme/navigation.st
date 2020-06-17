<div class="nav-home">
<a href="$page.home.href$" $if(page.home.active)$class="active"$endif$>
$if(page.properties.("documentation.title"))$$page.properties.("documentation.title")$$else$$page.home.title$$endif$
</a>
</div>
<div class="nav-version">
Version $if(page.properties.("documentation.version"))$$page.properties.("documentation.version")$$else$$page.properties.("project.version")$$endif$
</div>
$groups()$
<div class="nav-toc">
$page.navigation$
</div>
