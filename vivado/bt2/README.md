== Links Documentation ==

https://digilent.com/reference/pmod/pmodbt2/start
https://digilent.com/reference/pmod/pmodbt2/reference-manual
https://ww1.microchip.com/downloads/en/DeviceDoc/bluetooth_cr_UG-v1.0r.pdf

https://www.cl.cam.ac.uk/~jrrk2/docs/pmod-bt/

https://digilent.com/reference/learn/programmable-logic/tutorials/auto-connect-2-bt2_s/start?_ga=2.166468726.959301395.1704274818-763839222.1687501189



== UART Connection ==

The very first test to get to know the BT2 Pmod is to test out it's UART interface.
To test the UART interface, connect jumper wires between a USB TTL adapter and the BT2 pins.
Then use a terminal emulator such as YAT, TeraTerm or Hyperterminal to connect to the BT2.

USB-Adapter used: AZDelivery 5 x UART-TTL USB Adapter mit CH340G Konverter für 3.3V und 5V


=== Terminal Settings ===
Terminal Type Text
Serial port 
115,200 Kbps baud rate, 
8 bits, 
no parity, 
1 stop bit
Hardware flow control enabled (Hardware RTS/CTS in YAT)
Terminal: Text (Not binary) 


=== Pin Connections ===
The pinout is documented here: https://digilent.com/reference/pmod/pmodbt2/start
Some pins remain not connected (N/C) because they are not needed for the UART interface.

USB Adapter	|	BT2
---------------------------
RXD 			TXD (pin 3)
TXD 			RXD (pin 2)

RTS				CTS (pin 4)
CTS				RTS (pin 1)

GND         	GND (pin 5)
3v3         	VCC (pin 6)

N/C         	Status (pin 7) (not connected)
3v3         	RST (pin 8) (Connected to 3v3 because connecting RST to GND performs a reset!)
N/C         	NC (pin 9) (not connected)
N/C         	NC (pin 10) (not connected)
N/C         	GND (pin 11) (not connected)
N/C         	VCC (pin 12) (not connected)







The default bluetooth friendly name is: RNBT-0509


== DATA Mode ==
In Data mode, the BT2 runs it's internal bluetooth stack and per default starts a RFCOMM server
that provides a SPP connection. Using the android app Serial Bluetooth Terminal, you can talk
to the spp server!


== Command Mode ==
Normal payload is transmitted in Data Mode. 
Configuring the device is done in Command Mode.
The device accepts a switch from Data to Command Mode within the first 60 seconds of operation after power on.
the sequence $$$ enters command mode and is answered with CMD.

Type $$$ into the terminal emulator to enter command mode.
The module returns the string CMD, which indicates that your connection and terminal
settings are correct. While in command mode, the module accepts ASCII bytes as commands. When you enter a valid command, the module returns AOK. It returns ERR for an
invalid command and ? for unrecognized commands. Type h <cr> to see a list of commands.


$$$ (NOT ???) enter data mode within the first 60 seconds of operation. Once in command mode, the yellow LED will flicker rapidly. The BT2 will respond to $$$ with CMD
--- leave data mode. The response to this command is END

In CMD mode:
x - check if you are in command mode and also lists all possible commands.







*** SET COMMANDS ***
SA,<3,0>   - Authentication
SC,<hex>   - Service Class
SD,<hex>   - Device Class
SE,<1-16>  - UUID
SF,1       - Factory Defaults
SH,<hex>   - HID flags
SI,<hex>   - Inquiry Scan Window
SJ,<hex>   - Page Scan Window
SL,<E,O,N> - Parity
SM,<0-5>   - Mode (0=slav,1=mstr,2=trig,3=auto,4=DTR,5=Any)
SN,<name>  - Name
SO,<text>  - conn/discon Status
SP,<text>  - Pin Code
SR,<adr>   - Remote Address
SS,<text>  - Service Name
ST,<num>   - Config Timer
SU,<rate>  - Baudrate
SW,<hex>   - Sniff Rate
SX,<1,0>   - Bonding
SY,<hex>   - TX power
SZ,<num>   - Raw Baudrate
S~,<0-6>   - Profile (0=SPP,1=DCE,2=DTE,3=MDM,4=D&S,6=HID
S?,<0-1>   - role switch
S$,<char>  - CMD mode char
S@,<hex>   - io port dir
S&,<hex>   - io port val
S%,<hex>   - io boot dir
S^,<hex>   - io boot val
S*,<hex>   - pio(8-11) set
S|,<hex>   - low power timers
S+,<num>   - DTR timer
S=,<hex>   - Key mapper
S:,<num>   - sleep timer
*** DISPLAY      ***
D     - Basic Settings
E     - Extended Settings
G<X>  - Stored setting
GB    - BT Address, This will output the Bluetooth MAC Address!
GF    - BT Address of Last Connection
GK    - Connect Status
G&    - I/O Ports
V     - Firmare version
*** OTHER        ***
C,<adr>    - Connect
F,1        - Fast Mode
I,<time>,<cod> - Device Scan Inquiry
J          - Hide Pin Code
K,         - Kill (disconnect)
L,         - toggle local echo
P,<text>   - Pass Thru
Q          - Quiet (no discovery)
R,1        - Reboot
T,<0,1>    - send data in CMD mode
U,<rate>,<E,O,N> - Temp Uart Change
Z          - low power sleep
&          - Read switches




== HCI ==

The default behaviour of the BT2 is to start the SPP RFCOMM server.
To disble this behaviour and to enable the HCI (Host Controller Interface) defined
in the Bluetooth specification, it is necessary to change a value in flash. 

Flash on the BT2 is accessible via SPI. To get access to the SPI interface, 
a header bar has to be soldered onto the BT2 module.

https://www.cl.cam.ac.uk/~jrrk2/docs/pmod-bt/