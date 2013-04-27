(defn collection-type [col]
  (if (list? col) :list
    (if (vector? col) :vector
      (if (map? col) :map))))