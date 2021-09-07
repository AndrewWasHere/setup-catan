# Setup Catan

Generate a Catan board layout with random placement of harbor values,
resources, and roll values. Output is sent to standard out. This is useful when
setting up a 3D Catan board.

Usage:

```
 $ julia setup_catan.jl 
row 1: | water | harbor(wood) | water | harbor(3:1) | 
row 2: | harbor(sheep) | brick(3) | wood(4) | ore(5) | water | 
row 3: | water | wheat(9) | brick(8) | wheat(12) | wood(11) | harbor(3:1) | 
row 4: | harbor(ore) | wood(3) | desert(0) | sheep(9) | sheep(11) | ore(6) | water | 
row 5: | water | ore(5) | sheep(4) | wood(10) | wheat(2) | harbor(brick) | 
row 6: | harbor(wheat) | sheep(6) | wheat(10) | brick(8) | water | 
row 7: | water | harbor(3:1) | water | harbor(3:1) | 
```

## Disclaimer

I am just learning Julia, so this project should in no way be considered a good
example of how to use the language.

## License

MIT License. See LICENSE.txt.