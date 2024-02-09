# Example Containerised Azure Function

> Simple containerised Azure Function written in PowerShell

- It's a massive Windows image, the base image needs selecting carefully and I need to look for a smaller one - nano server maybe?
- Creates a Containerised Linux PowerShell Function
- Can be deployed on a local Docker engine or in a Web App - other container engines will probably work but I've not tried :)
- Function is called via a Web Browser or via curl/Invoke-WebConnection - Hit the Web App endpoint and append `api/chuck` to the URL
- Call it without a parameter to get a Chuck joke from the CMDB in the `dev` category
- Call it with one of the parameters to get a Chuck joke from a specific category by appending `?name=sport` to the URL

~~~bash
curl https://azurefunctionwebapp.azurewebsites.net/api/chuck?name=dev
Category: dev - Chuck Norris can spawn threads that complete before they are started.
~~~

## Categories

- animal
- career
- celebrity
- dev
- explicit
- fashion
- food
- history
- money
- movie
- music
- political
- religion
- science
- sport
- travel
