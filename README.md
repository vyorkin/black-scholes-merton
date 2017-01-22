# Black-Scholes model in PureScript

[Wikipedia](https://en.wikipedia.org/wiki/Black%E2%80%93Scholes_model)

### Input

* Type of option (Call or Put)
* Current price of the underlying
* Strike price of the option
* Risk-free interest rate
* Time until expiration (in years)
* Daily volatility

### Output

The current value of the option

### Formulas

#### Call:

![Call](https://wikimedia.org/api/rest_v1/media/math/render/svg/02b3399c25f96bc2ce3a70dbce628620cf726c29)

#### Put:

![Put](https://wikimedia.org/api/rest_v1/media/math/render/svg/4ed2a3d59c05c42219bc864b50099ebd5baf4297)
