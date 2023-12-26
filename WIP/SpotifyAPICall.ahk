#Requires AutoHotkey v2.0
#SingleInstance Force

; Spotify API credentials
SettingsFile := "C:\Users\" A_UserName "\AutohotkeySettings\Cred.ini"
clientID := IniRead(SettingsFile, "Spotify", "ID")
clientSecret := IniRead(SettingsFile, "Spotify", "Secret")

; Function to get access token
GetAccessToken(clientID, clientSecret) {
    authURL := "https://api.spotify.com/api/token"
    clientCreds := clientID . ":" . clientSecret
    clientCredsB64 := Base64Encode(clientCreds)

    ; Headers
    headers := "Authorization: Basic " . clientCredsB64 . "`r`n"
              . "Content-Type: application/x-www-form-urlencoded`r`n"

    ; Body
    data := "grant_type=client_credentials"

    ; Make a POST request
    httpRequest := ComObject("WinHttp.WinHttpRequest.5.1")
    httpRequest.Open("POST", authURL, false)
    httpRequest.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    httpRequest.SetRequestHeader("Authorization", "Basic " . clientCredsB64)
    httpRequest.Send(data)

    if (httpRequest.Status != 200) {
        MsgBox("Could not authenticate client.")
        MsgBox("The response status code is: " httpRequest.Status "`n Data was: " data)

        return
    }

    response := httpRequest.ResponseText

    ; Simple parsing for access token (assuming response structure is simple)
    accessToken := RegExReplace(response, ".*" "access_token" ":" "(.*?)" ".*", "$1")
    return accessToken
}

; Function to Base64 encode
Base64Encode(data) {
    ; Calculate the required size for the buffer
    varSize := StrPut(data, "UTF-16") * 2
    var := Buffer(varSize)

    ; Copy the string into the buffer
    StrPut(data, var, "UTF-16")

    ; Call the DLL function to get the required size for the Base64 string
    size := 0
    DllCall("Crypt32.dll\CryptBinaryToStringW", "ptr", var.ptr, "uint", StrLen(data) * 2, "uint", 1, "ptr", 0, "uint*", size)

    ; Allocate buffer for the Base64 string
    b64 := Buffer(size * 2)

    ; Call the DLL function again to get the Base64 string
    DllCall("Crypt32.dll\CryptBinaryToStringW", "ptr", var.ptr, "uint", StrLen(data) * 2, "uint", 1, "ptr", b64.ptr, "uint*", size)

    ; Return the Base64 string
    returnB64 := StrGet(b64, "UTF-16")
    return returnB64
}

; Main function
Main() {
    accessToken := GetAccessToken(clientID, clientSecret)
    MsgBox("Access Token: " . accessToken)
    ; Further API calls can be made using the accessToken
}

; Run the main function
Main()
