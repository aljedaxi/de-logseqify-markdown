result/bin/de-logseqify-markdown: dasein-janet/init.janet jpm_tree lockfile.jdn
	@nix build .

lockfile.jdn: project.janet
	@jpm make-lockfile

jpm_tree: project.janet
	@jpm deps -l

#btw, jpm deps -l will fix any "recompilation needed" issues
test:
	@jpm -l janet dasein-janet/init.janet test.md

.PHONY: test
