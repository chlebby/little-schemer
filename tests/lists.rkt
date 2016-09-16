#lang racket/base

(require rackunit
         "../lists.rkt")

(test-case
  "firsts"
  (check-equal? (firsts '()) '())
  (check-equal? (firsts '((a))) '(a))
  (check-equal? (firsts '((a) (b))) '(a b))
  (check-equal? (firsts '((a b) (b c))) '(a b)))

(test-case
  "rember*"
  (check-equal? (rember* 'a '()) '())
  (check-equal? (rember* 'a '(b)) '(b))
  (check-equal? (rember* 'a '(a)) '())
  (check-equal? (rember* 'a '(a a)) '())
  (check-equal? (rember* 'a '(b a)) '(b))
  (check-equal? (rember* 'a '((a))) '(()))
  (check-equal? (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup))
                '((coffee) ((tea)) (and (hick)))))

(test-case
  "occur*"
  (check-equal? (occur* 'a '()) 0)
  (check-equal? (occur* 'a '(a)) 1)
  (check-equal? (occur* 'a '(b)) 0)
  (check-equal? (occur* 'a '(a a)) 2)
  (check-equal? (occur* 'a '(b a)) 1)
  (check-equal? (occur* 'a '((a))) 1)
  (check-equal? (occur* 'banana '((banana)
                                  (split ((((banana ice)))
                                          (cream (banana))
                                          sherbet))
                                  (banana)
                                  (bread)
                                  (banana brandy)))
                5))

(test-case
  "insertR*"
  (check-equal? (insertR* 'new 'old '()) '())
  (check-equal? (insertR* 'new 'old '(a)) '(a))
  (check-equal? (insertR* 'new 'old '(old)) '(old new))
  (check-equal? (insertR* 'new 'old '(a old)) '(a old new))
  (check-equal? (insertR* 'new 'old '((old))) '((old new)))
  (check-equal? (insertR* 'roast 'chuck '((how much (wood))
                                              could
                                              ((a (wood) chuck))
                                              (((chuck)))
                                              (if (a) ((wood chuck)))
                                              could chuck wood))
                '((how much (wood))
                  could
                  ((a (wood) chuck roast))
                  (((chuck roast)))
                  (if (a) ((wood chuck roast)))
                  could chuck roast wood)))

(test-case
  "insertL*"
  (check-equal? (insertL* 'new 'old '()) '())
  (check-equal? (insertL* 'new 'old '(a)) '(a))
  (check-equal? (insertL* 'new 'old '(old)) '(new old))
  (check-equal? (insertL* 'new 'old '(a old)) '(a new old))
  (check-equal? (insertL* 'new 'old '((old))) '((new old)))
  (check-equal? (insertL* 'pecker 'chuck '((how much (wood))
                                           could
                                           ((a (wood) chuck))
                                           (((chuck)))
                                           (if (a) ((wood chuck)))
                                           could chuck wood))
                '((how much (wood))
                  could
                  ((a (wood) pecker chuck))
                  (((pecker chuck)))
                  (if (a) ((wood pecker chuck)))
                  could pecker chuck wood)))

(test-case
  "member*"
  (check-equal? (member* 'a '()) #f)
  (check-equal? (member* 'a '(a)) #t)
  (check-equal? (member* 'a '(b a)) #t)
  (check-equal? (member* 'a '((a))) #t)
  (check-equal? (member* 'chips '((potato (chips ((with) fish)) (chips)))) #t))
