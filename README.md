# README

## Table of Contents
[Hosted At](#hostedat)

[Description](#description)

[Versions](#versions)

[Testing/Coverage](#testing/coverage)

[Useage](#usage)
- [Classes](#classes)
- [Monsters](#monsters)
- [Characters](#characters)
- [Parties](#parties)

## Description
Code assessment for Hotel Engine. General idea is that you can create (simple) Dungeons and Dragons characters, and assign them to parties.


## Hosted At
https://dtt-hotel-engine.herokuapp.com/

## Versions
Ruby Version: `ruby 2.7.3`
Rails Version: `Rails 6.0.3.7`

## Testing/Coverage
Tested with RSpec and SimpleCov

<img width="948" alt="Screen Shot 2021-05-31 at 2 23 19 PM" src="https://user-images.githubusercontent.com/57076945/120239558-caf6a780-c21b-11eb-862c-5f8cb8bac40f.png">

### Bugs
- Testing env randomly instantiates a party object.

# Usage
Best used with [Postman](https://www.postman.com/) or similar HTML request platform.

## Classes
`dtt-hotel-engine.herokuapp.com/api/v1/dnd/classes` 
Retrieves class info from [DnD5EApi.co](https://dnd5eapi.co).

## Monsters
`dtt-hotel-engine.herokuapp.com/api/v1/dnd/monsters`
Retrieves monster info from [DnD5EApi.co](https://dnd5eapi.co).

# Characters
## Get
`dtt-hotel-engine.herokuapp.com/api/v1/dnd/characters`
Returns all character info in JSON.

`dtt-hotel-engine.herokuapp.com/api/v1/dnd/characters/:character_id`
Returns specific character info in JSON.

## Post
```
params = {
  name: "John Smith",
  level: 1,
  character_class: "rogue",
}

post "dtt-hotel-engine.herokuapp.com/api/v1/dnd/characters", params: params
```
Accepts valid params, creates, and returns character info in JSON.

## Patch/Put
```
params = {
  name: "Jane Doe",
  party_id: 2,
}

patch "dtt-hotel-engine.herokuapp.com/api/v1/dnd/characters/:character_id", params: params
```
Accepts valid params, updates, and returns character info in JSON.

## Delete
```
delete "dtt-hotel-engine.herokuapp.com/api/v1/dnd/characters/:character_id
```
Accepts a valid character_id, deletes, and returns character info in JSON.

# Parties
## Get
`dtt-hotel-engine.herokuapp.com/api/v1/dnd/parties`
Returns all party info in JSON.

`dtt-hotel-engine.herokuapp.com/api/v1/dnd/parties/:party_id`
Returns specific party info in JSON.

## Post
```
params = {
  name: "The Mighty Nine",
}

post "dtt-hotel-engine.herokuapp.com/api/v1/dnd/parties", params: params
```
Accepts valid params, creates, and returns party info in JSON.

## Patch/Put
```
params = {
  name: "Big Hero 6",
}

patch "dtt-hotel-engine.herokuapp.com/api/v1/dnd/parties/:party_id", params: params
```
Accepts valid params, updates, and returns party info in JSON.

## Delete
```
delete "dtt-hotel-engine.herokuapp.com/api/v1/dnd/parties/:party_id
```
Accepts a valid character_id, deletes, and returns party info in JSON.




