## Module BlackScholes

#### `OptionType`

``` purescript
data OptionType
  = Call
  | Put
```

#### `OptionParams`

``` purescript
type OptionParams = { "stock" :: Number, "strike" :: Number, "riskFree" :: Number, "time" :: Number, "volatility" :: Number }
```

#### `optionPrice`

``` purescript
optionPrice :: OptionType -> OptionParams -> Number
```


