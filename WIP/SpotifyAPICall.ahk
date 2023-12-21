#Requires AutoHotkey v2.0
#SingleInstance Force

; Spotify API credentials
clientID := "your_client_id"
clientSecret := "your_client_secret"

; Function to get access token
GetAccessToken(clientID, clientSecret) {
    authURL := "https://accounts.spotify.com/api/token"
    clientCreds := clientID . ":" . clientSecret
    clientCredsB64 := Base64Encode(clientCreds)

    ; Headers
    headers := "Authorization: Basic " . clientCredsB64 . "`r`n"
              . "Content-Type: application/x-www-form-urlencoded`r`n"

    ; Body
    data := "grant_type=client_credentials"

    ; Make a POST request
    httpRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    httpRequest.Open("POST", authURL, false)
    httpRequest.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    httpRequest.SetRequestHeader("Authorization", "Basic " . clientCredsB64)
    httpRequest.Send(data)

    if (httpRequest.Status != 200) {
        MsgBox("Could not authenticate client.")
        return
    }

    response := httpRequest.ResponseText
    ; Simple parsing for access token (assuming response structure is simple)
    accessToken := RegExReplace(response, ".*" "access_token" ":" "(.*?)" ".*", "$1")
    return accessToken
}

; Function to Base64 encode
Base64Encode(data) {
    VarSetCapacity(var, StrPut(data, "UTF-16") * 2, 0)
    StrPut(data, &var, "UTF-16")
    DllCall("Crypt32.dll\CryptBinaryToStringW", "ptr", &var, "uint", StrLen(data) * 2, "uint", 1, "ptr", 0, "uint*", size := 0)
    VarSetCapacity(b64, size * 2, 0)
    DllCall("Crypt32.dll\CryptBinaryToStringW", "ptr", &var, "uint", StrLen(data) * 2, "uint", 1, "ptr", &b64, "uint*", size)
    return StrGet(&b64, "UTF-16")
}

; Main function
Main() {
    accessToken := GetAccessToken(clientID, clientSecret)
    MsgBox("Access Token: " . accessToken)
    ; Further API calls can be made using the accessToken
}

; Run the main function
Main()
