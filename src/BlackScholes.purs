module BlackScholes
       ( OptionType(..)
       , OptionParams(..)
       , optionPrice
       ) where

import Prelude
import Math (abs, exp, log, pow, sqrt)

data OptionType = Call | Put
type OptionParams =
  { stock :: Number
  , strike :: Number
  , riskFree :: Number
  , time :: Number
  , volatility :: Number
  }

optionPrice :: OptionType -> OptionParams -> Number
optionPrice option { stock, strike, riskFree, time, volatility } =
  case option of
    Call -> stock * phi d1 - strike * exp (-riskFree * time) * phi d2
    Put  -> strike * exp (-riskFree * time) * phi (-d2) - stock * phi (-d1)
  where
    d1 = ((log stock / strike) + ((riskFree + (pow volatility 2.0) / 2.0) * time)) / (volatility * sqrt time)
    d2 = d1 - volatility * sqrt time

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
        sign = if x > 0.0 then 1.0 else -1.0
        t = 1.0 / (1.0 + p * abs x / sqrt 2.0)
        e = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * exp(-x * x / 2.0)
        y = 0.5 * (sign * e + 1.0)
