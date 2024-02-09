using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = ($Request.Query.Name)

if (-not ($name.ToLower() -in @("animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"))) {
    $name = "dev"
}

if ($name.ToLower()) {
    $strJoke = ((Invoke-WebRequest "https://api.chucknorris.io/jokes/random?category=$name").Content | ConvertFrom-Json | Select-Object -Property Value).Value
    $body = ("Category: {0} - {1}" -f $name.ToLower(),$strJoke)
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})