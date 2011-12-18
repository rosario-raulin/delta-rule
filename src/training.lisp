(defpackage :rosario-raulin-ci
  (:use
   :common-lisp
   :alexandria)
  (:export
   :online-training!
   :*random-limit*))

(in-package :rosario-raulin-ci)

(defparameter *random-limit* 10)

(defun vector-+ (v1 v2)
  (let ((result (copy-array v1)))
    (loop for x across v1
	  for y across v2
	  for z from 0
	  do (setf (aref result z) (+ x y))
	  finally (return result))))

(defun scalar-* (vector scalar)
  (let ((result (copy-array vector)))
    (loop for x across vector
	  for y from 0
	  do (setf (aref result y) (* x scalar))
	  finally (return result))))

(defun gen-random-array (size)
  (let ((result (make-array size)))
    (loop for x from 0 below size
	  do (setf (aref result x) (random *random-limit*))
	  finally (return result))))

;; Based loosely on the algorithms described by Rudolf Kruse (et al.) in
;; "Computational Intelligence" (2011, Vieweg+Teubner, first copy)
(defun online-training! (examples
			 &key
			   (step 1)
			   (weights
			    (gen-random-array
			     (array-dimension (car (first examples)) 0)))
			   (threshold (random *random-limit*)))
  (loop for e = 0
	do (loop for (x . o) in examples
		 do (let ((y (if (>= (loop for xn across x
					   for w across weights
					   sum (* xn w)) threshold)
				 1
				 0)))
		      (unless (= y o)
			(let ((diff (* step (- o y))))
			  (decf threshold diff)
			  (setf weights (vector-+ weights (scalar-* x diff)))
			  (incf e (abs (- o y)))))))
	until (<= e 0)
	finally (return (values threshold weights))))
