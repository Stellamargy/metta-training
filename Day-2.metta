(Person Smith 20 Male)
(Person Lisa 27 Female)
(Person Adam 30 Male)
(Person Lily 10 Female)

(=(getPerson $name)
    (match &self 
        (Person $name $age $gender)
        (Person $name $age $gender)
    )

)
(=(getAge (Person $name $age $gender))$age)
(=(isMale (Person $n $a $g))(== $g Male))





;;Rewrite the equation if one is male and age < 18 = boy else man
;;if one is female and age <18 = girl else woman


!(let*(
($Person (getPerson Adam))
($age (getAge $Person))
($isMale (isMale $Person))
(if $isMale
(if (< $age 18)))
(this Person is a boy)
(this person is a man)
(if (<$18))

))