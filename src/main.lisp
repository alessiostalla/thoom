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

(defvar *gameaction* nil)
(defvar *demosequence* nil)
(defvar *advancedemo* nil)

(defun start-title ()
  (setf *gameaction* nil)
  (setf *demosequence* nil)
  (advance-demo))

(defun advance-demo ()
  (setf *advancedemo* t))

(defvar *singletics* nil) ; debug flag to cancel adaptiveness

(defun doom-loop ()
  (init-graphics)
  (loop
     :do (progn
	   (start-frame)
	   (if *singletics*
	       (progn)
	       (try-run-tics))
	   (update-sounds)
	   (display))))

(defun init-graphics ())

(defvar *gametic* 0)
(defvar *screens* (make-array 5))
(defvar *screen-width* 320)
(defvar *screen-height* 200)
(defvar *setsizeneeded* nil)
(defvar *viewactivestate* nil)
(defvar *menuactivestate* nil)
(defvar *inhelpscreensstate* nil)
(defvar *fullscreen* nil)
(defvar *oldgamestate* nil)
(defvar *borderdrawcount* nil)
(defvar *wipegamestate* :demo-screen)
(defvar *gamestate* nil)

(defun display ()
  (let (redrawsbar wipe)
    (when *setsizeneeded*
      (execute-set-view-size)
      (setf *oldgamestate* nil) ; force background redraw
      (setf *borderdrawcount* 3))
    (when (not (eql *gamestate* *wipegamestate*))
      (setf wipe t)
      (wipe-start-screen))
    (when (and (eql *gamestate* :level) (not (zerop *gametic*)))
      (hu-erase))))

(defvar *wipe-scr-start*)

(defun wipe-start-screen ()
  (let ((scr (aref *screens* 2)))
    (setf (aref *screens* 0) scr *wipe-scr-start* scr)))
