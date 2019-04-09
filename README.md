## SmartConnect Network Performance Test

In order to determine that a network connection is of sufficient quality to keep a connection from the EFTPOS Terminal, exchanging data in real-time, open with the server and with minimum interruptions, this repo contains a set of files that all essentially do the same thing (in slightly different ways) - ping the SmartConnect API endpoint (_api.smart-connect.cloud_) continuously in one-second intervals (until manually stopped) and measure and output the latency of every successful request (or report if requests drop).

There are 4 files in the `scripts` folder that might be used:

* [cmd-ping-console.bat](/scripts/cmd-ping-console.bat) – **Windows** batch file which will output ping results **only** to the console – when the console is closed the output is lost (Windows Command Prompt can only output to either console or file);

* [cmd-ping-file.bat](/scripts/cmd-ping-file.bat) – **Windows** batch file which will output ping results **only** to a file – it will not output anything to the console (Windows Command Prompt can only output to either console or file);

* [powershell-ping.ps1](/scripts/powershell-ping.ps1) – **Windows** PowerShell file which will output ping results **both** to the console and a file – the preferred method for Windows where [PowerShell](https://en.wikipedia.org/wiki/PowerShell) is available (typically Windows 7 or newer);

* [ping.sh](/scripts/ping.sh) – a Bash version to execute on **macOS**, outputting **both** to the console and a file.

An indication of sub-optimal network performance is either:

* **Connection errors** - timeouts or otherwise failures, or

* **Latency spikes** – a normal latency in a healthy network should not exceed `100 ms` (in most cases it should be below `50 ms`), if the latency jumps substantially higher than that (over `1,000 ms` in extreme cases) - this might cause delays with the integration.

Note that it is not unusual to have one-off issues – where a single request times out or a latency slightly jumps but falls back to normal levels quickly. However, if such a condition persists, the likelihood of having connectivity issues increases.

Obviously, these scripts need to be executed on the same network which the POS and the EFTPOS device are connected to - ideally on the same host machine where the POS is installed (if it is a desktop machine), or on a desktop/laptop connected to the same WiFi network or the same switch (if it is a tablet or otherwise not possible to run it on the main desktop).

In order to obtain the most insight into the network performance, the script should ideally be executed _around the time_ issues in connectivity are being observed, and generally for longer periods of time. Our recommendation is to have it running for a minimum of 15-20 minutes and analyze the trends in latency/drops during that time; or leave it running for several hours if issues happen randomly throughout the day.

A healthy network will generally produce an output like this:

![Healthy Network](/readme-images/healthy.png)

In contrast, a sub-optimal network performance might produce an output looking like this:

![Unhealthy Network](/readme-images/unhealthy.png)

The sharp increases in latency and request timeouts are a good indication that the data exchange between SmartConnect and the POS/EFTPOS Terminal is likely to experience delays and interruptions.
