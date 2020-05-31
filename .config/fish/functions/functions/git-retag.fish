function git-retag
	for tag in $argv 
		git push origin :refs/tags/$tag
		git tag -f $tag
	end
end
