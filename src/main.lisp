(in-package :thoom)

(defun doom-main ()
  (find-response-file)
  (identify-version)
  (multiple-value-bind (options free-args)
      (opts:get-opts)
    (let (modified-game
	  (nomonsters (when-option (options :nomonsters) t))
	  (respawnparm (when-option (options :respawn) t))
	  (fast (when-option (options :fast) t))
	  (devparm (when-option (options :devparm) t))
	  (deathmatch (or (when-option (options :altdeath) :alt)
			  (when-option (options :altdeath) t)))
	  (startskill :medium)
	  (startepisode 1)
	  (startmap 1)
	  autostart)
      (init-menu)
      (init-refresh)
      (init-play-loop)
      ;; i-init? d-checknetgame?
      (init-sound)
      (init-hud)
      (init-status-bar)
      (start-title)
      (doom-loop)
    )))

(defun find-response-file ())

(defun identify-version ())

(defun init-menu ())

(defun init-refresh ())

(defun init-play-loop ())

(defun init-sound ())

(defun init-hud ())

(defun init-status-bar ())

(defun start-title ())

(defun doom-loop ()
  (init-graphics)
  (loop
       :do (start-frame)))

(defun init-graphics ())

(defun start-frame ())
