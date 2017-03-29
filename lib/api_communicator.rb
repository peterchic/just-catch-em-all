require 'rest-client'
require 'json'
require 'pry'

response = RestClient.get("https://phalt-pokeapi.p.mashape.com/pokemon",
  {
    "X-Mashape-Key" => "lC9qQhTl1tmshbvcCkjNA3b3WgEmp1OqHEzjsnEX23DqhR8FNa",
    "Accept" => "application/json"
  }
)

binding.pry
"hi"
