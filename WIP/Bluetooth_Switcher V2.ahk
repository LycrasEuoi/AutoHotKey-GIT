#Requires AutoHotkey v2.0

; Define the Bluetooth device name
deviceName := "Galaxy Buds Pro (ACFC)" ; Replace with your Bluetooth device name

; Declare global variables
global SizeOf_BLUETOOTH_DEVICE_SEARCH_PARAMS := 20
global SizeOf_BTH_DEVICE_NAME := 520
global SizeOf_BLUETOOTH_DEVICE_INFO := 560
global BTH_DEVICE_NAME := 0x00000004
global BLUETOOTH_ERROR_SUCCESS := 0

; Define the hotkey to connect the Bluetooth device
^!b:: ; Use Ctrl+Alt+B as the hotkey. You can customize this.
{
    ; Load the necessary DLLs
    DllCall("LoadLibrary", "str", "BluetoothAPIs.dll", "ptr")
    DllCall("LoadLibrary", "str", "Kernel32.dll", "ptr")

    ; Initialize the BLUETOOTH_DEVICE_SEARCH_PARAMS structure as an object
    searchParams := Object()
    searchParams.Size := SizeOf_BLUETOOTH_DEVICE_SEARCH_PARAMS
    searchParams.Flags := BTH_DEVICE_NAME

    ; Allocate a buffer for deviceInfo
    deviceInfoBuffer := BufferAlloc(SizeOf_BLUETOOTH_DEVICE_INFO)

    ; Start device discovery
    deviceFound := BluetoothFindFirstDevice(searchParams, &deviceInfoBuffer)

    ; Loop through devices to find the specified device
    while (deviceFound)
    {
        deviceNameFound := BluetoothGetDeviceInfo(&deviceInfoBuffer, "Name")
        if (deviceNameFound = deviceName)
        {
            ; Connect to the device
            if (BluetoothAuthenticateDevice(0, 0) = BLUETOOTH_ERROR_SUCCESS)
            {
                MsgBox("Connected to Bluetooth device: " . deviceNameFound)
            }
            else
            {
                MsgBox("Failed to connect to Bluetooth device: " . deviceNameFound)
            }
            
            ; Close device discovery
            BluetoothFindDeviceClose(&deviceInfoBuffer)
            return
        }
        
        ; Continue searching for the next device
        deviceFound := BluetoothFindNextDevice(&deviceInfoBuffer)
    }

    ; Close device discovery if the device is not found
    BluetoothFindDeviceClose(&deviceInfoBuffer)
    MsgBox("Bluetooth device not found: " . deviceName)
    return
}

; Function to find the first Bluetooth device
BluetoothFindFirstDevice(searchParams, deviceInfo)
{
    return DllCall("BluetoothAPIs\BluetoothFindFirstDevice", "ptr", 0, "ptr", &searchParams, "ptr", &deviceInfo)
}

; Function to find the next Bluetooth device
BluetoothFindNextDevice(deviceInfo)
{
    return DllCall("BluetoothAPIs\BluetoothFindNextDevice", "ptr", deviceInfo, "ptr", &deviceInfo)
}

; Function to close Bluetooth device discovery
BluetoothFindDeviceClose(deviceInfo)
{
    return DllCall("BluetoothAPIs\BluetoothFindDeviceClose", "ptr", deviceInfo)
}

; Function to get Bluetooth device information
BluetoothGetDeviceInfo(deviceInfo, infoType)
{
    deviceInfoData := Object()
    deviceInfoData.Size := SizeOf_BLUETOOTH_DEVICE_INFO
    if (DllCall("BluetoothAPIs\BluetoothGetDeviceInfo", "ptr", deviceInfo, "ptr", &deviceInfoData) = BLUETOOTH_ERROR_SUCCESS)
    {
        if (infoType = "Name")
            return StrGet(NumGet(&deviceInfoData + SizeOf_BTH_DEVICE_NAME, "ptr"), "UTF-16")
        ; Add more infoType cases as needed
    }
    return ""
}

; Function to authenticate Bluetooth device
BluetoothAuthenticateDevice(deviceInfo, hwnd)
{
    return DllCall("BluetoothAPIs\BluetoothAuthenticateDevice", "ptr", hwnd, "ptr", deviceInfo, "ptr", 0)
}
