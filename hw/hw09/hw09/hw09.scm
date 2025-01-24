(define (curry-cook formals body)
  (if (null? (cdr formals))  ; 如果只剩下一个参数
      `(lambda (, (car formals)) ,body)  ; 创建普通的 lambda 函数
      `(lambda (, (car formals))  ; 外层 lambda 函数
         ,(curry-cook (cdr formals) body))))  ; 对剩余参数递归创建柯里化 lambda

(define (curry-consume curry args)
  (if (null? args)  ; 如果参数为空，返回当前柯里化函数或结果
      curry
      (curry-consume (curry (car args)) (cdr args))))  ; 将当前参数传递给函数并递归调用

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))

(define (switch-to-cond switch-expr)
  (cons 'cond  ; 转换为 cond 表达式
    (map
      (lambda (option)
        (cons (list 'equal? (car (cdr switch-expr)) (car option))  ; 使用 (car (cdr ...)) 提取 expr
              (cdr option)))  ; 动作部分：option 的第二个元素
      (car (cdr (cdr switch-expr))))))  ; 使用 (cdr (cdr ...)) 获取 options 列表

