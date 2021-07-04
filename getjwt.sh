#!/bin/bash

newjwt () {

    getjwt=$(curl --location --request POST 'http://localhost:4000/users' --header 'Content-Type: application/json' --data-raw '{ "username":"teste", "orgName":"Usuario"}')
    echo $getjwt
    
}
newjwt