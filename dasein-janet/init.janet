(import spork/argparse)
(import spork/json)
(use spork/sh-dsl)
(import remarkable)

(def argparse-params
  ["deal with logseq markdown"
   :default {:kind :accumulate
             :help "the file to parse"}])

(defn parse-tag [s]
  (let [[k v] (string/split "::" s)]
    [(keyword k) (->> v (string/split "," ) (map string/trim))]))

# TODO you could make this a peg. wouldn't that be cool!
(defn parse-logseq-tags [s]
  (let [stuff (->> s (string/split "\n") (mapcat parse-tag) )]
    (struct ;stuff)))

(defn ppp [o]
  ($ echo (json/encode o) | jq ))

# TODO turn this into json
(defn fanagle [document]
  `this is our core logic. turn that ugly logseq shit into something fun.`
  (let [[_type _ children] document
        [tag-block list & whatever] children
        tags (parse-logseq-tags (first (last tag-block)))
        [_type _ list-items] list
        content (mapcat last list-items)]
    content))

(defn main
  [& args]
  (let [res (argparse/argparse ;argparse-params)]
    (unless res (os/exit 1))
    (let [{:default [filename]} res]
      (->> filename slurp remarkable/parse-md fanagle ppp))))

