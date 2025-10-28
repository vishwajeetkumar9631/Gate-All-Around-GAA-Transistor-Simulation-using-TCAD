
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "gate" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "source" 4 (color:rgb 1 1 0 )"##" )
(sdegeo:define-contact-set "drain" 4 (color:rgb 1 1 1 )"##" )
(sdegeo:define-contact-set "substrate" 4 (color:rgb 0 1 1 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Restore GUI session parameters:
(sde:set-window-position 1161 175)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 100 )
