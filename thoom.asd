(defsystem "thoom"
  :version "0.1.0"
  :author "Alessio Stalla"
  :license "AGPL"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "packages")
		 (:file "video")
		 (:file "hu")
		 (:file "main"))))
  :description "A DOOM implementation in Lisp"
  :in-order-to ((test-op (test-op "thoom/tests"))))
