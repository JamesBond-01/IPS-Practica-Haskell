data Color = Red | Black
data RBT a = Empty | Node Color (RBT a) a (RBT a)

insert :: (Ord a) => a -> RBT a -> RBT a
insert x t = makeBlack (ins x t)
    where
        ins x Empty = Node Red Empty x Empty
        ins x (Node color left a right)
            | x > a = balance color left a (ins x right)
            | x < a = balance color (ins x left) a right
            | otherwise = Node color left a right

makeBlack :: RBT a -> RBT a
makeBlack Empty = Empty
makeBlack (Node _ left a right) = Node Black left a right

balance :: Color -> RBT a -> a -> RBT a -> RBT a
balance Black (Node Red (Node Red a x b) y c) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black (Node Red a x (Node Red b y c)) z d = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red (Node Red b y c) z d) = Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red b y (Node Red c z d)) = Node Red (Node Black a x b) y (Node Black c z d)
balance color left a right = Node color left a right

fromOrdList :: (Ord a) => [a] -> RBT a
fromOrdList [] = Empty
fromOrdList (x:xs) = insert x (fromOrdList xs)