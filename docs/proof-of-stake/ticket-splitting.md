# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> Ticket Splitting

---

Ticket splitting is the process of splitting the cost of a full ticket with other DCR holders. This allows you to stake and participate in Decred's governance even if you don't have enough DCR to purchase a full ticket. The minimum amount of DCR that can be put into a split ticket is 5 DCR. 

This page will provide you a high-level description of how ticket splitting works, instructions on setting up the necessary Split Ticket Buyer software and splitting your first ticket. 

If you prefer video, try this [tutorial](https://www.youtube.com/watch?v=9L8P7hL5v6w).

!!! warning "Warning"
    Ticket Splitting is still in Beta. The code for splitting tickets has not been extensively vetted by automated tests and more experienced community members. See [risks in joining the beta](https://github.com/matheusd/dcr-split-ticket-matcher/blob/master/docs/beta.md#risks-in-joining-the-beta) for further explanation of the risks. 


## Requirements

- **Decrediton wallet:** You will need [Decrediton](../wallets/decrediton/decrediton-setup.md) version 1.2.1 or later to run the Split Ticket Buyer. 
- **5 DCR:** A minimum of 5 DCR is required to participate in ticket splitting. This must be in your wallet, not on an exchange. 
- **Split Ticket Buyer:** This is the software that coordinates ticket splitting with other participants. To install it, download a binary release for your OS [here](https://github.com/matheusd/dcr-split-ticket-matcher/releases/latest) or [build from source](building.md).


## How it works

DCR holders wishing to split a ticket join a "session" with other participants. Sessions can be public or private. There is typically at least one public session going at all times. Participants in a session pledge an amount of DCR they are willing to spend, and when the  total amount pledged by all participants reaches the ticket price, a ticket is automatically purchased. 

Coordination of sessions is currently done on Decred's Slack group in the #ticket_splitting channel, or in the Telegram group located [here](https://t.me/dcrtktsplit). 

To prevent ticket splitting from being used to game Decred's PoS voting mechanism, voting rights for a split ticket are assigned pseudorandomly to a single participant, based on the  percentage of their contribution. I.e., if someone purchases 60% of a split ticket, they have a 60% chance of being selected as the voter for that ticket. Further details about the voting algorithm can be found [here](https://github.com/matheusd/dcr-split-ticket-matcher/blob/master/docs/voter-selection-ago.md). 

### Further reading

For more on ticket splitting, including further explanation of the risks involved, voting, and technical specs of the Split Ticket Buyer software, see the following:

- [DCR Ticket Splitting — All you need to know!](https://medium.com/decred/dcr-ticket-splitting-all-you-need-to-know-b8edc6b65db3): a thorough overview of how ticket splitting works. 
- [Split Ticket Buyer documentation](https://github.com/matheusd/dcr-split-ticket-matcher/tree/master/docs): Technical documentation for the Split Ticket Matcher software used to fascilitate ticket splitting. 



## Setting up Ticket Splitting

These instructions will walk you through buying a ticket using the GUI version of Split Ticket Buyer. For instructions on installing the Command-line Interface (CLI) version, see [here](https://github.com/matheusd/dcr-split-ticket-matcher/blob/master/docs/client-cli.md).

1. Create an account with a Voting Service Provider (VSP) that supports ticket splitting. Below is a list of VSPs that support ticket splitting.

    - [https://stake.decredbrasil.com](https://stake.decredbrasil.com)
    - [https://decredvoting.com](https://stake.decredbrasil.com)

1. Login to your VSP and navigate to the `Settings` tab. Copy the API token.

    ![VSP Settings page](../img/ticket_splitting_settings.png)

1. Open your Decrediton wallet. Navigate to the `Tickets` tab, select your VSP from the Stakepool dropdown menu, and paste in your VSP API key. If you already have another VSP configured, add the new VSP as you would any other VSP. 

    ![Ticket tab Decrediton](../img/ticket_splitting_decrediton.png)

1. Enter your wallet passphrase. You should now see your configured stakepool.

    ![Configured Decrediton Stakepool](../img/ticket_splitting_config_stakepool.png)

1. Download the Split Ticket Matcher software for your OS.

    - Split Ticket Matcher [downloads](https://github.com/matheusd/dcr-split-ticket-matcher/releases/tag/v0.7.0).
    - Split Ticket Matcher instructions on [building from source](https://github.com/matheusd/dcr-split-ticket-matcher/blob/master/docs/building.md).

1. Run the `splitticketbuyergui` executable. This will open the Split Ticket Buyer GUI (shown below). 

    ![Split Ticket Buyer config menu](../img/ticket_splitting_gui.png)


1. Click `Config -> Load from decrediton` and select your wallet name and VSP from the drop-down menus. 

    ![Split Ticket Buyer config menu](../img/split_ticket_buyer_config_menut.png)

1. Enter the amount of DCR you wish to put into your split ticket. Currently, only integer numbers are supported in the GUI version of Split Ticket Buyer. In the CLI version you can purchase arbitrary amounts. The minimum amount of DCR you can contribute is 5 DCR. 

    ![Split Ticket Buyer config menu](../img/split_ticket_buyer_amount.png)

1. Pick a session to join. Public session names can typically be found on the websites of VSPs that support ticket splitting, or in the ticket splitting chat channels (#ticket_splitting channel on Decred's Slack group or in the Telegram group located [here](https://t.me/dcrtktsplit)). 

1. Enter the name of the ticket buying session you want to join and your wallet passphrase. Then click `Participate` to join the session. In the screenshot below, we're joining a public session, `decredvoting1`. You can also create private sessions with other participants. All that is required to create a private session is for all participants to use the same session name. 

    ![Split Ticket Buyer config menu](../img/ticket_splitting_enter_session.png)

    After successfully joining a session, you will see the number of other participants and the total amount of DCR currently in the pool.  

    ![Split Ticket Buyer config menu](../img/ticket_splitting_joined_session.png)

    You are now in the ticket splitting pool! Until the ticket price is reached, no DCR is spent. Participants are free to change the amount pledged, change wallets, or leave the pool altogether. 

1. Wait for the amount of pledged DCR to reach the ticket price. While the time this takes can vary, public sessions are fairly active and often reach the ticket price in about a day. 

    Once the amount in the pool reaches the current ticket price, all participating wallets will automatically buy their portion of the ticket. At this point, the Split Ticket Buyer outputs details about the purchased ticket, including the amount contributed by other participants and who was selected to [vote](https://github.com/matheusd/dcr-split-ticket-matcher/blob/master/docs/voter-selection-ago.md).

    ![Split Ticket Buyer config menu](../img/split_ticket_successful_purchase.png)


1. You can now close Split Ticket Buyer and Decrediton. Your VSP should email you a confirmation once your split ticket has been purchased, as well a notification email when your ticket was called to vote. Voting rewards are split according to the percentage of the split ticket each participant bought, and sent to the wallet used to purchase the split ticket. 


## Troubleshooting

When loading your wallet and VSP configuration details into Split Ticket Buyer (Step #7), some users may see the following error:

![Split Ticket Buyer config error](../img/split_ticket_buyer_config_error.png)

In this case, you may need to manually update a parameter value in the `splitticketbuyer.conf` file. See the [video tutorial]([tutorial](https://www.youtube.com/watch?v=9L8P7hL5v6w)) for a step-by-step walkthrough of fixing this error. 

### General help

General technical support is often available in the #ticket_splitting channel on Decred's Slack group, or in the Telegram group located [here](https://t.me/dcrtktsplit). 


