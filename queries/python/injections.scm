; (string) @assembly (#match? @assembly "^\"(add|mov|ldr|str) .*\"$")

((string_content) @injection.content
 (#set! injection.language "asm"))

; ((string
;   (string_start) @injection.language) @injection.content)
