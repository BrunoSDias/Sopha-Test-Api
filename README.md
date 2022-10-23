* System dependencies
  We're using docker here. After install docker you will need to run 
 ```
  docker-compose build
```

* Running
```
 docker-compose up -d
```

# Authentication
- POST '/auth' with params {email: your_email, password: your_password, password_confirmation: your_password_again} to register a USER in API
- POST '/auth/sign_in' with params {email: your_email, password: your_password} that will give you a Bearer Token in response header which will be used to make the '/stores' requests
## Endpoints

 - GET '/stores' to SHOW ALL stores registered in your user

 - POST '/stores' params{name: "Example"} to CREATE a STORE to your user

 - PATCH '/stores' params{id: your_store_id, name: new_name} to UPDATE your STORE name

 - DELETE '/stores params{id: your_store_id} to DELETE your STORE


	
