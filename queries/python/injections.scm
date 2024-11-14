; (string) @assembly (#match? @assembly "^\"(add|mov|ldr|str) .*\"$")

;((string_content) @injection.content
; (#set! injection.language "asm"))

; ((string
;   (string_start) @injection.language) @injection.content)
;(function_definition
;	name: (identifier))@Variable
 ;;; it blocks
 ; ((function_call
 ;     name: (identifier) @func_name
 ;     arguments: (arguments (_) @test.name (function_definition))
 ; ) (#match? @func_name "^it$")) @test.definition

  ;(function_definition
  ;  name: (identifier)@func_name
  ;(#match? @func_name "^test_")
  ;)



        ;((identifier) @foo (#set! type "parameter"))
  ;(function_definition
  ;  name: (identifier)@test_func
  ;(#match? @test_func "^test_")
  ;)
  ;
