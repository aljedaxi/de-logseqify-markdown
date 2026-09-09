(declare-project
  :name "dasein-janet"
  :description ```stupid shit ngl ```
  :dependencies ["https://github.com/pyrmont/remarkable"
                 "https://github.com/janet-lang/spork"
                {:url "https://github.com/ianthehenry/judge.git" :tag "v2.11.0"}]
  :version "0.0.0")

(declare-executable
  :name "de-logseqify-markdown"
  :entry "dasein-janet/init.janet")
