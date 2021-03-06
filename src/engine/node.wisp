(import fs "fs")
(import [rest] "../list")
(import [str] "../runtime")
(import [read-from-string] "../reader")
(import [compile-program] "../compiler")


(defn transpile
  [source uri]
  (str (compile-program
        ;; Wrap program body into a list in order to to read
        ;; all of it.
        (rest (read-from-string (str "(do " source ")") uri))) "\n"))

;; Register `.wisp` file extension so that
;; modules can be simply required.
(set! (get require.extensions ".wisp")
  (fn [module uri]
    (._compile module
               (transpile (.read-file-sync fs uri :utf8))
               uri)))

(export transpile)
