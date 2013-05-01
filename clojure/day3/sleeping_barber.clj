; lol doesn't work

(defprotocol BarberShop
  (arrives [a customer])
  (cuts_hair [a]))

(defrecord Cuts [chairs]
  BarberShop
  (arrives [_ customer] (if (< (count chairs) 3)
                            (Cuts. (flatten (list chairs customer)))
                            (Cuts. chairs)))
  (cuts_hair [_] (Cuts.
                    (when (not (empty? chairs))
                      (Thread/sleep 20)
                      (println (str "Cutting hair of " (first chairs)))
                      (Cuts. (rest chairs))))))

(defn barber [shop]
  (while true (shop cuts_hair))
  )

(defn street [shop]
  (while true (do
    (Thread/sleep (rand-int 10 30))
    (shop arrives (str "Ted" (rand-int 1 100))))
  )
)
