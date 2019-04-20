# <img class="dcr-icon" src="/img/dcr-icons/Harddrive.svg" /> Security

This page provides a list of things you can do to improve your security when working with DCR, or cryptocurrencies more generally.


## System setup

Here are some measures you can take when setting up your hardware and software to make your system more secure. 

- **Disk encryption:** pretty much every OS supports disk encryption of some kind. Use it to secure any machines you use, so that they are protected against trivial theft. Note that a sophisticated adversary can extract your disk encryption keys from your device's RAM if they can access your machine while powered on.

- **Remove unnecessary software:** if you have a substantial amount of cryptocurrency on your machine, you should remove all unnecessary software. This prevents exploits that expolit vulnerabilities in unneeded software. 

- **Run an open source OS:** while many people use Windows or Mac for their operating system, it is impossible to know what these OSes are doing at all times if the corresponding source code is closed. Running an open source OS (e.g. Linux variants, *BSD) gives you some assurance that your sensitive information, including wallet keys, is not being sent to a corporate or government server.

- **Run Qubes:** Qubes is the only OS that uses the on-board IOMMU to partition the networking devices from the OS main memory by default on hardware that supports it. Qubes is also very convenient for creating single-purpose virtual machines, called “AppVMs”, that are nearly ideal for use with cryptocurrency applications.

- **Buy all computer components in person:** TLAs have been shown to intercept computer hardware in transit and implant malware of various sorts. Buy all computers and components in person at a store near you to avoid this.

- **Disable ME or similar:** Intel CPUs use a system called “Intel Management Engine” to allow users to access a number of supposedly-useful security features. USG users of Intel’s hardware disable ME, and me_cleaner can be used to manually remove it by individuals.

- **Electromagnetic shielding:** It has been known for decades that monitors and LCDs can be monitored remotely via a process known as “Van Eck phreaking”. Keyboards have been shown to leak EM signals that can be read 10s of meters away, through walls, and nation state government militaries and intelligence services have been using EM shielding as a countermeasure since the 1960s or earlier.

## Operations security (OPSEC)

Once you have a secure system set up, here are some operational security measures you can take when running your system.

- **Limit physical access to hardware:** physical access is king, so don’t let attackers get physical access to it. If possible, store your machine in a locked room with strictly limited access.

- **Avoid using your machine in public places:** this advice extends to the fiat banking world as well. When computing in public, you cannot control the presence of other parties, their computing devices, surveillance cameras, etc.

- **Keep mobile devices away from your machine:** modern phones and tablets have multiple microphones and can pick up audio from 20-30 feet away. Keep your mobile devices in a separate room while entering sensitive information into your machine, e.g. wallet seeds, passwords and passphrases.

- **Only run dcrwallet on ticketbuying machine:** dcrd, the consensus daemon, necessarily communicates with a variety of peers on the public internet. Run dcrwallet on a locked down machine and have it connect to a remote dcrd to minimize traffic going to or from your secure machine.

- **Audit your traffic:** using COTS gear, you can audit down to layer 2. keep in mind that you cannot audit most TLS traffic offline because of how ephemeral keys are used.

