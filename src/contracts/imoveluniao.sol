// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts@4.8.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.0/security/Pausable.sol";
import "@openzeppelin/contracts@4.8.0/access/AccessControl.sol";
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts@4.8.0/utils/Counters.sol";

contract ImovelUniao is ERC721, Pausable, AccessControl, ERC721Burnable {
    using Counters for Counters.Counter;

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    Counters.Counter private _tokenIdCounter;
    bytes16 public  classe;
    bytes16 public rip;
    bytes16 private id_utilizacao;
    uint256 private dt_cadastro;
    bytes4  private uf;
    bytes32 private municipio;
    bytes32 private endereco; 
    bytes32 private bairro;
    bytes32 private conceituacao;
    bytes16 private tipo_imovel;
    bytes32 private regime_utilizacao;
    bytes32 private proprietario;
    uint256 private dt_inicio_utlizacao;
    uint16  private area_total;
    uint16  private area_uniao;

    constructor() ERC721("ImovelUniao", "IMU") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function safeMint(address to) public onlyRole(MINTER_ROLE) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
