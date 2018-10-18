#lang racket
(require (planet dyoo/simply-scheme:1:2/simply-scheme))

;Returns the value of the ball.
(define (ball-val ball)
  (let ([R 10]
        [G 15]
        [B 20]
        [W 1])
    (case ball
      ((R) 10)
      ((G) 15)
      ((B) 20)
      ((W) 1))))

;Returns the number of balls in the bucket with the given order.
(define (count-balls color bucket)
  (count (keep (lambda (c) (equal? color c)) bucket)))

;Return a sentence containing number of each colored ball.
(define (color-counts bucket)
  (let ([RED (count-balls 'R bucket)]
        [GRN (count-balls 'G bucket)]
        [BLU (count-balls 'B bucket)]
        [WHI (count-balls 'W bucket)])
    (displayln (list RED GRN BLU WHI))))

;Return the total value of a bucket.
(define (bucket-val bucket)
  (let ([RED (count-balls 'R bucket)]
        [GRN (count-balls 'G bucket)]
        [BLU (count-balls 'B bucket)]
        [WHI (count-balls 'W bucket)])
    (let ((R (* RED 10)) (G (* GRN 15)) (B (* BLU 20)) (W (* WHI 1)))
      (let ((val (+ R G B W)))
    display val))))

;Takes two arguments as bucket1 and bucket2, return the winner.
(define (judge Bucket_1 Bucket_2)
  (let ((val1 (bucket-val Bucket_1)))
    (let ((val2 (bucket-val Bucket_2)))
      (if (equal? val1 val2)
          (displayln "It\'s a Tie .. !"))
      (if (> val1 val2)
          (displayln "Bucket 1, Won .. !"))
      (if (< val1 val2)
          (displayln "Bucket 2, Won .. !")))))


;Output

(define bucket1 '(R B G R R R B W R W))
(define bucket2 '(W R R R R G B B G W))
(define bucket3 '(W))

(displayln "Output 1")
(judge bucket1 bucket3)
(bucket-val bucket1)
(color-counts bucket1)
(newline)
(displayln "Output 2")
(judge bucket1 bucket2)
(bucket-val bucket2)
(color-counts bucket2)
