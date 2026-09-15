result/bin/de-logseqify-markdown: dasein-janet/init.janet project.janet
	@jpm deps -l
	@jpm make-lockfile
	@nix build .

#btw, jpm deps -l will fix any "recompilation needed" issues
test:
	@jpm -l janet dasein-janet/init.janet test.md

