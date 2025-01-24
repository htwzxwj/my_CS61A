(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (helper s index)
    (if (null? s)  ; Base case: if the list is empty, return an empty list
        '()  ; Return an empty list
        (cons (list index (car s))  ; Pair the index with the current element
              (helper (cdr s) (+ index 1)))))  ; Recur with the rest of the list and increment the index
  (helper s 0))  ; Start the helper with index 0
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists S1 and S2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? s1 s2)
  ; BEGIN PROBLEM 16
  (cond
    ((null? s1) s2)  ; 如果 s1 为空，返回 s2
    ((null? s2) s1)  ; 如果 s2 为空，返回 s1
    (else
     (if (ordered? (car s1) (car s2))  ; 比较 s1 和 s2 的第一个元素
         (cons (car s1) (merge ordered? (cdr s1) s2))  ; s1 的第一个元素较小，递归合并剩余部分
         (cons (car s2) (merge ordered? s1 (cdr s2)))))))  ; s2 的第一个元素较小，递归合并剩余部分
  ; END PROBLEM 16

;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           'replace-this-line
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
         'replace-this-line
         ; END OPTIONAL PROBLEM 2
         )))

; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
  'replace-this-line)
