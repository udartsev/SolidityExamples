## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| erc721_KittyCore.sol | 3aba3d3f30dbc8fd9a0d5f3a05976189dfcf392a |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Ownable** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | transferOwnership | Public ❗️ | 🛑  | onlyOwner |
||||||
| **ERC721** | Implementation |  |||
| └ | totalSupply | Public ❗️ |   |NO❗️ |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | ownerOf | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | supportsInterface | External ❗️ |   |NO❗️ |
||||||
| **GeneScienceInterface** | Implementation |  |||
| └ | isGeneScience | Public ❗️ |   |NO❗️ |
| └ | mixGenes | Public ❗️ | 🛑  |NO❗️ |
||||||
| **KittyAccessControl** | Implementation |  |||
| └ | setCEO | External ❗️ | 🛑  | onlyCEO |
| └ | setCFO | External ❗️ | 🛑  | onlyCEO |
| └ | setCOO | External ❗️ | 🛑  | onlyCEO |
| └ | pause | External ❗️ | 🛑  | onlyCLevel whenNotPaused |
| └ | unpause | Public ❗️ | 🛑  | onlyCEO whenPaused |
||||||
| **KittyBase** | Implementation | KittyAccessControl |||
| └ | _transfer | Internal 🔒 | 🛑  | |
| └ | _createKitty | Internal 🔒 | 🛑  | |
| └ | setSecondsPerBlock | External ❗️ | 🛑  | onlyCLevel |
||||||
| **ERC721Metadata** | Implementation |  |||
| └ | getMetadata | Public ❗️ |   |NO❗️ |
||||||
| **KittyOwnership** | Implementation | KittyBase, ERC721 |||
| └ | supportsInterface | External ❗️ |   |NO❗️ |
| └ | setMetadataAddress | Public ❗️ | 🛑  | onlyCEO |
| └ | _owns | Internal 🔒 |   | |
| └ | _approvedFor | Internal 🔒 |   | |
| └ | _approve | Internal 🔒 | 🛑  | |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  | whenNotPaused |
| └ | approve | External ❗️ | 🛑  | whenNotPaused |
| └ | transferFrom | External ❗️ | 🛑  | whenNotPaused |
| └ | totalSupply | Public ❗️ |   |NO❗️ |
| └ | ownerOf | External ❗️ |   |NO❗️ |
| └ | tokensOfOwner | External ❗️ |   |NO❗️ |
| └ | _memcpy | Private 🔐 |   | |
| └ | _toString | Private 🔐 |   | |
| └ | tokenMetadata | External ❗️ |   |NO❗️ |
||||||
| **KittyBreeding** | Implementation | KittyOwnership |||
| └ | setGeneScienceAddress | External ❗️ | 🛑  | onlyCEO |
| └ | _isReadyToBreed | Internal 🔒 |   | |
| └ | _isSiringPermitted | Internal 🔒 |   | |
| └ | _triggerCooldown | Internal 🔒 | 🛑  | |
| └ | approveSiring | External ❗️ | 🛑  | whenNotPaused |
| └ | setAutoBirthFee | External ❗️ | 🛑  | onlyCOO |
| └ | _isReadyToGiveBirth | Private 🔐 |   | |
| └ | isReadyToBreed | Public ❗️ |   |NO❗️ |
| └ | isPregnant | Public ❗️ |   |NO❗️ |
| └ | _isValidMatingPair | Private 🔐 |   | |
| └ | _canBreedWithViaAuction | Internal 🔒 |   | |
| └ | canBreedWith | External ❗️ |   |NO❗️ |
| └ | _breedWith | Internal 🔒 | 🛑  | |
| └ | breedWithAuto | External ❗️ |  💵 | whenNotPaused |
| └ | giveBirth | External ❗️ | 🛑  | whenNotPaused |
||||||
| **ClockAuctionBase** | Implementation |  |||
| └ | _owns | Internal 🔒 |   | |
| └ | _escrow | Internal 🔒 | 🛑  | |
| └ | _transfer | Internal 🔒 | 🛑  | |
| └ | _addAuction | Internal 🔒 | 🛑  | |
| └ | _cancelAuction | Internal 🔒 | 🛑  | |
| └ | _bid | Internal 🔒 | 🛑  | |
| └ | _removeAuction | Internal 🔒 | 🛑  | |
| └ | _isOnAuction | Internal 🔒 |   | |
| └ | _currentPrice | Internal 🔒 |   | |
| └ | _computeCurrentPrice | Internal 🔒 |   | |
| └ | _computeCut | Internal 🔒 |   | |
||||||
| **Pausable** | Implementation | Ownable |||
| └ | pause | Public ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner whenPaused |
||||||
| **ClockAuction** | Implementation | Pausable, ClockAuctionBase |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | withdrawBalance | External ❗️ | 🛑  |NO❗️ |
| └ | createAuction | External ❗️ | 🛑  | whenNotPaused |
| └ | bid | External ❗️ |  💵 | whenNotPaused |
| └ | cancelAuction | External ❗️ | 🛑  |NO❗️ |
| └ | cancelAuctionWhenPaused | External ❗️ | 🛑  | whenPaused onlyOwner |
| └ | getAuction | External ❗️ |   |NO❗️ |
| └ | getCurrentPrice | External ❗️ |   |NO❗️ |
||||||
| **SiringClockAuction** | Implementation | ClockAuction |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | ClockAuction |
| └ | createAuction | External ❗️ | 🛑  |NO❗️ |
| └ | bid | External ❗️ |  💵 |NO❗️ |
||||||
| **SaleClockAuction** | Implementation | ClockAuction |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | ClockAuction |
| └ | createAuction | External ❗️ | 🛑  |NO❗️ |
| └ | bid | External ❗️ |  💵 |NO❗️ |
| └ | averageGen0SalePrice | External ❗️ |   |NO❗️ |
||||||
| **KittyAuction** | Implementation | KittyBreeding |||
| └ | setSaleAuctionAddress | External ❗️ | 🛑  | onlyCEO |
| └ | setSiringAuctionAddress | External ❗️ | 🛑  | onlyCEO |
| └ | createSaleAuction | External ❗️ | 🛑  | whenNotPaused |
| └ | createSiringAuction | External ❗️ | 🛑  | whenNotPaused |
| └ | bidOnSiringAuction | External ❗️ |  💵 | whenNotPaused |
| └ | withdrawAuctionBalances | External ❗️ | 🛑  | onlyCLevel |
||||||
| **KittyMinting** | Implementation | KittyAuction |||
| └ | createPromoKitty | External ❗️ | 🛑  | onlyCOO |
| └ | createGen0Auction | External ❗️ | 🛑  | onlyCOO |
| └ | _computeNextGen0Price | Internal 🔒 |   | |
||||||
| **KittyCore** | Implementation | KittyMinting |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | setNewAddress | External ❗️ | 🛑  | onlyCEO whenPaused |
| └ | \<Fallback\> | External ❗️ |  💵 |NO❗️ |
| └ | getKitty | External ❗️ |   |NO❗️ |
| └ | unpause | Public ❗️ | 🛑  | onlyCEO whenPaused |
| └ | withdrawBalance | External ❗️ | 🛑  | onlyCFO |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
