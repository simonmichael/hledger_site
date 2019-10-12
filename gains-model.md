### A model for capital gains

WIP

Capital gain/loss (when the value of assets you hold increases/decreases
due to market price fluctuations) - is an important topic, since it can
generate tax liability.

Here is a description of how it works, intended for both users and
builders of accounting software (especially, plain text accounting
software).

By training I'm a software engineer, not an accountant. In places there
may be better accounting terms I'm not familiar with yet.

- lots/units -
  A quantity of some commodity, acquired at a certain price on a certain date,
  is called a *lot*, or *unit*. (I'm not sure which is the most standard term. Using lot for now.)

- Since you might have purchased the lot on a stock exchange, received it as a gift,
  or something else, we'll call this event *lot acquisition*, on the *acquisition date*.

- Later you might sell the lot for cash, or exchange it for something else, or gift it.
  We'll call this *lot disposal*.

- You might have paid current market value for the lot, or you might have
  paid less or more than that. We'll call what you paid/exchanged the *acquisition amount*.
  
- I think the acquisition amount is also called the *basis* or *cost basis*.
  Or possibly the current market value is the basis, regardless of what you paid.
  Perhaps it depends. To be clarified. The basis at which you acquired a lot is important.

- After acquisition, while you are still holding the lot, if the market value of that commodity goes up (or down),
  your potential return from disposing of the lot increases (or decreases).
  This is known as *capital gain (or loss)* (we'll just call it "capital gain").
  At this stage, the gain is only "on paper", so it is called *unrealised capital gain* (URG).
  This is not considered revenue, or taxable.

- It's common to be holding multiple lots, perhaps many, even in a single account.
  Eg, say you buy a small amount of some stock or cryptocurrency each week.
  Each purchase adds a new lot to your assets. We'll call this a *multi-lot balance*, or *balance*.

- URG is calculated for a lot at a certain point in time.
  Likewise for a multi-lot balance.

- realised capital gain

- lot withdrawal strategies

- specific identification
