(defsystem "thoom"
  :version "0.1.0"
  :author "Alessio Stalla"
  :license "AGPL"
  :depends-on ("unix-opts")
  :components ((:module "src"
                :components
                ((:file "packages")
		 (:file "main"))))
  :description "A DOOM implementation in Lisp"
  :in-order-to ((test-op (test-op "thoom/tests"))))
