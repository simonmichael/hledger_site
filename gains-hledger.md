### Capital gains in hledger

-  postings can have multiple commodities and multiple prices; each of
   these parts is a deposit or withdrawal to the account

- 
  ```haskell
  -- | Given a list of amounts all in the same commodity, interprets them
  -- as a sequence of lot deposits (the positive amounts) and withdrawals
  -- (the negative amounts), and applies them in order using the FIFO
  -- strategy for withdrawals, then returns the resulting lot balance (as
  -- another, shorter, list of amounts).
  sumLots :: [Amount] -> [Amount]
  ```
