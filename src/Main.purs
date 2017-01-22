module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Math (abs, exp, sqrt)

data OptionType = Call | Put

type OptionParams =
  { stock :: Number
  , strike :: Number
  , riskFree :: Number
  , time :: Number
  , volatility :: Number
  }

blackScholes :: OptionType -> OptionParams -> Number
blackScholes Call params = 1.0
blackScholes Put params = 2.0

phi :: Number -> Number
phi x = y
    where
        a1 =  0.254829592
        a2 = -0.284496736
        a3 =  1.421413741
        a4 = -1.453152027
        a5 =  1.061405429
        p  =  0.3275911

        -- Abramowitz and Stegun formula 7.1.26
        sign = if x > 0.0
                  then  1.0
                  else -1.0
        t = 1.0/(1.0 + p * abs x / sqrt 2.0)
        e = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * exp(-x * x / 2.0)
        y = 0.5 * (sign * e + 1.0)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"
