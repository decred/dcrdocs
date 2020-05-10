# Upgrading Decrediton

To upgrade Decrediton, simply download the new version and install it. You do not need to delete your existing version or perform any additional steps. When you open the upgraded version, your existing wallets and accounts will appear. 

---

## Upgrading steps

1. Download latest version. The latest downloads can be found at [https://decred.org/downloads/](https://decred.org/downloads/) or by clicking on the `Update Available` button in the upper right-hand corner of Decrediton.

    ![Decrediton update link](/img/decrediton/upgrading/update-available.png)

    Click on the link for your OS and download the installer.

    ![Decrediton update link](/img/decrediton/upgrading/download-link.png)

    !!! Warning "Security Tip"
    
        We recommend you also verify that your download hash matches the hash in the Decred releases manifest. For detailed instructions, read about [Verifying Binaries](https://docs.decred.org/advanced/verifying-binaries/).

        You will need to visit the [Release Binaries](https://github.com/decred/decred-binaries/releases) page to download the manifest and manifest signature:

        `decrediton-v{{ decreditonversion }}-manifest.txt`

        `decrediton-v{{ decreditonversion }}-manifest.txt.asc`

1. Close your current version of Decrediton (if open) and click on the downloaded installer. Follow the installation instructions as you would for any other program. 
1. Open Decrediton. Note that when upgrading, Decrediton may need to perform a one-time reindexing operation.  This can take several minutes to an hour depending on your hardware.
1. Click on the `Governance` tab to check for new Politeia proposals and consensus rule changes. Upgraded versions of Decrediton may contain latent consensus rule changes that will be automatically enabled if stakeholders vote to accept them. For more on voting, see the governance section of the [Using Decrediton](../wallets/decrediton/using-decrediton/#governance) page. 

