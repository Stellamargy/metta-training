;; Representating data/facts in Atomspace
(Movie Avator 1999 SciFi)


;;  Representating relationship in facts 
;; Linking Directors to movies
(Director James Avator)
;; I dont have Abcd movie in my atomspace (not an error ) but I cant query about it -no facts
(Director James Abcd)

;; Querying the atomspace by using the match
;;When querying you cn use variable to represent what you dont know and use correct label/data for what you know
;;Syntax
;;!(match &self (Pattern -pattern can be nested) return value)


;; add-atom is used to add atoms in atomspace
;;Any atom can be added .
;;(add-atom $atomspace(default to self) atom to be added)


;;remove-atom removes atom from atomspace
;;(remove-atom &atomspace(self) atom-to-be-removed)


;; code runs from top to bottom ,left to write
;;Metta is functional and logical language



;;functions in Metta
;;calling a function
;;(function-name p1 p2 p3 p4)
(=(greet $name)(Hi $name))
!(greet Stella)

;; Parent name of parent child name
(Parent Mary Lisa)
(Parent John Lisa)
(Parent Mary Smith)
(Parent John Smith)
(Parent Lisa Lily)
(Parent Adam Lily)


(Person Mary F)
(Person John M)
(Person Smith M)
(Person Lisa F)
(Person Adam M)
(Person Lily F)

;; The people in the family tree
!(unique (union 
    ;;get x first
        (unique (match &self (Parent $x $y) $x))
        ;;get y 
       (unique (match &self (Parent $x $y) $y))
        ;;then unify
))
;;The people in the family tree -v2
!(match &self (Person $n $g) $n)


;;The parents of Smith
!(match &self (Parent $p Smith) $p)

;;The siblings of Smith
!(unique((match &self (,
    (Parent $parentname Smith)
    (Parent $parentname $childname)
) $childname)))





;;Uncle of Lily
!(unique(
    (match &self (,
    (Parent $parentname Lily)
    (, (Parent $parentname1 $parentname) (Parent $parentname1 $childname1 )(Person $childname1 M) )
)$childname1)
))
;;Grand Parents of Lily
!(match &self (,
   (Parent $parentname Lily)
   (Parent $parentname1 $parentname)
)$parentname1)
;;Son in law of Mary
