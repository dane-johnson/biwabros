;; utilities for creating Single Page Applications in BiwaScheme

(define *root* ($ "#root"))

(define (render element parent)
  (console-log parent)
  (cond
   ((string? element) (element-append-child! parent element))
   ((pair? element)
    (cond
     ((eq? (car element) 'deref) (void) ;; Todo implement atoms
      )
     (else (let ((el (element-new (list (car element)))))
             (let loop ((childs (cdr element)))
               (when (not (null? childs))
                 (render (car childs) el)
                 (loop (cdr childs))))
             (element-append-child! parent el)))))
   (else (console-error "I don't know how to display " element))))

(define (render-root element)
  (render element *root*))
