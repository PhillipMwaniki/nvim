;extends

; Highlight the HTML around template actions ({{ ... }}) in .tmpl files.
; combined: the text chunks between actions are parsed as one HTML document.
((text) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined))
