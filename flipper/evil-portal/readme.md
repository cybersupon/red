# Creating an Evil Portal with Flipper Zero using Wi-Fi Marauder App

## Overview

This guide details how to use Flipper Zero with the Wi-Fi Marauder app to create an Evil Portal. An Evil Portal is a rogue access point designed to mimic a legitimate network, capturing credentials, injecting payloads, or conducting man-in-the-middle (MITM) attacks. The Wi-Fi Marauder app simplifies this process by providing built-in tools for Wi-Fi attacks directly on the Flipper Zero.

## Requirements

- **Flipper Zero:** The main device equipped with the Wi-Fi Marauder app.
- **Wi-Fi Dev Board:** A compatible Wi-Fi module (e.g., ESP8266, ESP32) connected to Flipper Zero for wireless attacks.
- **MicroSD Card:** For storing custom configurations or scripts if needed.
- **Power Source:** Such as a portable USB power bank for extended operation.

## Setup and Configuration

### 1. **Install the Wi-Fi Marauder App**
   - **Download the App:** If not already installed, download the Wi-Fi Marauder app from the Flipper Zero community or an official source.
   - **Install:** Follow the instructions to install the app on your Flipper Zero, typically by copying the app files to the `apps` folder on the MicroSD card.

### 2. **Connect the Wi-Fi Dev Board**
   - **Power and Ground:** Connect the VCC and GND pins of the Wi-Fi module to the corresponding pins on Flipper Zero.
   - **Communication:** Connect the TX and RX pins for UART communication between Flipper Zero and the Wi-Fi module.

### 3. **Configure the Wi-Fi Marauder App**
   - **Launch the App:** Power on Flipper Zero, navigate to the Wi-Fi Marauder app, and open it.
   - **Set Up Evil Portal:**
     - Choose the "Access Point" or "Evil Portal" option from the app menu.
     - **SSID Configuration:** Set a convincing SSID (e.g., "Free_Cafe_WiFi") and a basic WPA2 password if needed.
     - **Captive Portal:** Enable the captive portal feature to redirect users to a phishing page or to capture credentials.
     - **Payloads:** Upload or configure any HTML pages or scripts that will be served through the portal.

### 4. **Deploy and Activate the Evil Portal**
   - **Activate:** Once configured, start the Evil Portal through the Wi-Fi Marauder app.
   - **Monitor:** Use Flipper Zero’s interface to monitor devices that connect to the portal and capture data.

## Usage Scenarios

- **Credential Harvesting:** Capture credentials from users who connect to your rogue access point.
- **Payload Injection:** Redirect users to malicious sites or inject scripts into their sessions.
- **MITM Attacks:** Intercept and manipulate traffic between the connected users and the internet.

## Best Practices

- **Stealth:** Use an SSID that closely resembles legitimate networks in the area to avoid suspicion.
- **Legal Compliance:** Ensure you have proper authorization to perform such activities.
- **Security:** Secure your Flipper Zero and Wi-Fi Dev Board to prevent unauthorized use.
- **Controlled Testing:** Test your setup in a controlled environment before deploying it in the field.

## Conclusion

Using Flipper Zero with the Wi-Fi Marauder app is a straightforward method for deploying an Evil Portal during Red Team operations. This tool is powerful for credential harvesting, payload delivery, and MITM attacks, but should always be used responsibly and within legal boundaries. Happy hunting!
