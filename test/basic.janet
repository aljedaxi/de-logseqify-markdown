(use ../dasein-janet/init)
(use judge)

(test (parse-logseq-tags "tags:: react, programming, S tier") {:tags @["react" "programming" "S tier"]})
(test (parse-logseq-tags ```
tags:: react, programming, S tier
type:: post
layout:: layout.tmpl.jsx
published:: 2022-07-14
updated:: 2022-07-16
ci/action:: ci/revise
title:: react is still a library lol
ver:: 2
```)
  {:ci/action @["ci/revise"]
   :layout @["layout.tmpl.jsx"]
   :published @["2022-07-14"]
   :tags @["react" "programming" "S tier"]
   :title @["react is still a library lol"]
   :type @["post"]
   :updated @["2022-07-16"]
   :ver @["2"]})
