# <img class="dcr-icon" src="/img/dcr-icons/Config1.svg" /> Configuration

---

#### 1. What are the default ports `dcrd` and `dcrwallet` listen on?

##### `dcrd`

|             |Mainnet|Testnet|Simnet
---           |---   |---    |---
*Peer to Peer*| 9108 | 19108 | 18555
*RPC Server*  | 9109 | 19109 | 19556

##### `dcrwallet`

|                |Mainnet|Testnet|Simnet
---              |---   |---    |---
*JSON-RPC Server*| 9110 | 19110 | 19557
*gRPC Server*    | 9111 | 19111 | 19558

---

#### 2. What do you mean by configuration files for `dcrd`, `dcrwallet`, and `dcrctl`?

Each application (`dcrd`, `dcrwallet`, `dcrctl`) can have its own configuration files. Use `-h` and look at the path in parentheses of the configuration file option (`-C`, `--configfile`) to see the default path. Create a text file at the path and named according to that path you just looked up.

Then you can use the `dcrd` [sample config file](https://github.com/decred/dcrd/blob/a2771b8ce6938480ed98eaca6d9df29667cdacba/sampleconfig/sampleconfig.go#L10-L413) and `dcrwallet` [sample config file](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) to set whatever options you want. You can do the same thing for `dcrctl` too. The format is the same. Every command line option listed by `-h` can be specified in the config files (just use the long option name).

Once those are created and in place, you do not have to add all of the options to the command line all the time. For instance, you can run `dcrctl` without passing in any parameters on the command line:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Can I run mainnet and testnet daemons and wallets at the same time and on the same machine?

Yes, just add `--testnet` to the appropriate spots (`dcrd`, `dcrwallet`, `dcrctl`) and everything will work. This is why they use different ports and data/log directories.

---

#### 4. What are the security implications of using the same RPC server authentication passwords with `dcrd` and `dcrwallet`?

There is a lot less you can do with access to `dcrd` than you can with access to `dcrwallet`. Importantly, RPC access to `dcrwallet`, when the wallet is unlocked, can be used to spend coins.

When `dcrd` and `dcrwallet` are both on the same machine, it probably does not matter all that much, but when you are running more secure setups where the wallet is on a separate machine than `dcrd`, you would pretty clearly not want to use the same credentials for both. Remember that `dcrd` has to be on an Internet-facing machine in order to stay synced to the network (download the block chain data, broadcast transactions, and so on).

On the other hand, the `dcrwallet` that contains your funds, for best security, should really not be on a system that has Internet access as it is significantly more difficult for someone to steal your coins if the wallet that contains them is not even on a machine that is accessible via the Internet. If you are staking your coins, you will need at least one Internet-facing `dcrwallet` instance. Thus, the most secure setup involves having one "cold" `dcrwallet` instance that is on a machine that is not Internet-accessible, and a second "hot" `dcrwallet` instance (using a different seed of course) to which the cold dcrwallet instance delegates voting right via the `--ticketaddress` parameter, both of which use different credentials.

---

#### 5. Why am I connecting to only 8 outbound peers?

There is an intentional unconfigurable limit of 8 outbound peers. More outbound peers than that does not help you in any way and is actually worse for both you and the network. This has been tested extremely thoroughly in Bitcoin, including btcsuite (the upstream project for Decred). All you would do by upping your outbound connections is waste valuable slots of the relatively few public peers there are (there are always a much higher number of "leechers" than there are "seeders").

On the other hand, increasing your maximum connections, which really just increases the number of allowed inbound connections, helps the network by ensuring there are more slots available for new nodes and [SPV](../wallets/spv.md) clients.

---

#### 6. Why do I have no inbound connections after forwarding the appropriate port?

When nodes are new to the network, they are not accessible to other nodes until they have matured and been randomly selected as a known and good node. The node address manager internally segregates the node addresses into groups and non-deterministically selects groups in a cryptographically random manner. This reduces the chances multiple addresses from the same nets are selected which generally helps provide greater peer diversity, and perhaps more importantly, drastically reduces the chances an attacker is able to coerce your peer into only connecting to nodes they control.

This process should take several days before receiving an incoming connection.

To check and confirm that your node is ready to be accepted, see the output from the `dcrctl` command `getnetworkinfo`. Under `localaddresses`, you can see what address and port your node is accepting incoming conenctions. Confirm that this address is correct and that the specified port is open.

```
"localaddresses": [
    {
      "address": "***.***.*.***",
      "port": *****,
      "score": 0
    }
```

---

#### 7. How do I run dcrd and dcrwallet as a background daemon?

`dcrd` and `dcrwallet` do not provide a `--daemon` or `--detach` flag to run as a
daemon as this is considered bad practice. 
[This blog post](https://www.mikeperham.com/2014/09/22/dont-daemonize-your-daemons/)
by Mike Perham provides some background information.

Modern operating systems provide specialized facilities for running processes as
background daemons.
For example, systemd and Upstart are Linux utilities specifically designed to
run long-lived daemons.
MacOS X provides a daemon service named
[launchd](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html).
This is the recommended method for running `dcrd` or `dcrwallet` as daemons.

The [dcrd GitHub repository](https://github.com/decred/dcrd/blob/master/release/services/systemd/dcrd.service)
provides a sample service file for systemd.
A detailed guide on using this file to configure dcrd as a service on Debian 9
can be found at [stakey.club](https://stakey.club/en/dcrd-as-a-linux-service/).
