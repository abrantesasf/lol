;;;;========================================================================;;;;
;;;; Land of Lisp: Learn to Program in Lisp, One Game at a Time             ;;;;
;;;; http://landoflisp.com                                                  ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Capítulo 02: Creating Your First Lisp Program                          ;;;;
;;;;        Jogo: Guess-My-Number                                           ;;;;
;;;;------------------------------------------------------------------------;;;;
;;;; Por: Abrantes Araújo Silva Filho                                       ;;;;
;;;;      abrantesasf@gmail.com                                             ;;;;
;;;;========================================================================;;;;


;;; Definição de variáveis globais
(defparameter *menor* 1)
(defparameter *maior* 100)


;;; Função para "chutar" um número
(defun chutar-numero ()
  ;; Realiza uma operação de shift aritmético com a representação binária da
  ;; soma dos números *menor* e *maior*, usando -1 como count (o número será
  ;; deslocado 1 bit para a direita, sendo dividio por 2). Estamos assim, na
  ;; realidade, tirando uma média entre os números usando divisão inteira:
  (ash (+ *menor* *maior*) -1))


;;; Função maior: quando o computador chutar um número menor do que o correto,
;;; o jogador deverá informar que o número correto é maior:
(defun maior ()
  ;; Se o número é maior do que o chute do computador, deloca o número *menor*
  ;; 1 unidade a mais o que o chute atual:
  (setf *menor* (1+ (chutar-numero)))
  (chutar-numero))


;;; Função menor: quando o computador chutar um número maior do que o correto,
;;; o jogador deverá informar que o número correto é menor:
(defun menor ()
  ;; Se o número é menor do que o chute do computador, desloca o número *maior*
  ;; 1 unidade a menos do que chute atual:
  (setf *maior* (1- (chutar-numero)))
  (chutar-numero))


;;; Recomeçar o jogo:
(defun comecar ()
  (defparameter *menor* 1)
  (defparameter *maior* 100)
  (chutar-numero))
