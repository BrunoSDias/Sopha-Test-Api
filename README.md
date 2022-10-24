* System dependencies
  We're using docker here. After install docker you will need to run 
 ```
  docker-compose build
```

* Running
```
 docker-compose up -d
```

## Registration
``` POST '/auth' with params {email: your_email, password: your_password, password_confirmation: your_password_again} ```
- That will create a login for you in the api

## Authentication
``` POST '/auth/sign_in' with params {email: your_email, password: your_password} ``` 
- that will give you a Bearer Token in response header which will be used to do requests in '/stores'

## Endpoints
 - GET '/stores' to SHOW ALL stores registered in your user

 - POST '/stores' params{name: "Example"} to CREATE a STORE to your user

 - PATCH '/stores' params{id: your_store_id, name: new_name} to UPDATE your STORE name

 - DELETE '/stores params{id: your_store_id} to DELETE your STORE

## EC2 Address
 - 54.221.69.141:3000 
 
## To run tests
 ``` $ rspec```
