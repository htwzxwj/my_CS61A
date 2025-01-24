(define (if-program predicate if-true if-false)
  `(if ,predicate ,if-true ,if-false))  ; 直接生成列表，包含条件和分支

(define (square n) (* n n))

(define (pow-expr base exp)
  (cond
    ((= exp 0) 1)  ; 基线条件：任何数的 0 次方为 1
    ((even? exp)   ; 如果 exp 是偶数
     `(square ,(pow-expr base (/ exp 2))))  ; 利用 x^(2y) = (x^y)^2
    (else          ; 如果 exp 是奇数
     `(* ,base ,(pow-expr base (- exp 1))))))  ; 利用 x^(2y+1) = x * (x^y)^2


; 定义 repeat 宏
(define-macro (repeat n expr)
  `(repeated-call ,n (lambda () ,expr)))  ; 使用 repeated-call 执行 expr

; 定义 repeated-call 函数
(define (repeated-call n f)
  (if (= n 1)  ; 如果 n 是 1，直接调用 f 并返回结果
      (f)
      (begin
        (f)  ; 调用 f
        (repeated-call (- n 1) f))))  ; 递归调用 repeated-call，n 减 1

