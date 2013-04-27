(defprotocol Animal
  (name [a])
  (species [a])
  (speak [a]))

(defrecord Dog [myName]
  Animal
  (name [_] (Dog. (println myName)))
  (species [_] (Dog. (println "canine")))
  (speak [_] (Dog. (println "woof, woof"))))

(defrecord Cat [myName]
  Animal
  (name [_] (Cat. (println myName)))
  (species [_] (Cat. (println "feline")))
  (speak [_] (Cat. (println "meow"))))
