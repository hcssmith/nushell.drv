 # Initialise a nix flake repo.
 def "src init" [
	--application (-a) # Include application-builders flake
] {
	git init
	nix flake init
	fh add github:hcssmith/flake-lib
	if $application {
		fh add github:hcssmith/application-builders
	}
}

# Link local repo to github.
def "src github" [
	repo:string # Repo name
	--owner (-o) = hcssmith # Repo owner, defaults to hcssmith
	] {
	git remote add origin $'git@github.com:($owner)/($repo).git'
}

# Commit with message
def "src commit" [
	message: string
] {
	git commit -m $'"($message)"'
}

# Push to repo
def "src push" [] {
	git push -u origin master
}

# Show git log
def "src log" [] {
	git log | jc --git-log | from json
}
