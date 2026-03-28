// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AirlineTicket is ERC721, Ownable {
    uint256 private _ticketIds;

    enum TicketStatus { Active, Used, Cancelled, Refunded }

    struct TicketData {
        string flightCode;
        string departure;
        string arrival;
        uint256 date;
        string seatClass;
        TicketStatus status;
        uint256 price;
    }

    mapping(uint256 => TicketData) public tickets;

    event TicketMinted(uint256 indexed ticketId, address indexed passenger, string flightCode);
    event TicketCheckedIn(uint256 indexed ticketId);

    constructor() ERC721("Flightchain", "FC") Ownable(msg.sender) {}

    // Mint a new Soulbound Ticket
    function mintTicket(
        address passenger,
        string memory _flightCode,
        string memory _departure,
        string memory _arrival,
        uint256 _date,
        string memory _seatClass,
        uint256 _price
    ) public payable {
        _ticketIds++;
        uint256 newTicketId = _ticketIds;

        tickets[newTicketId] = TicketData({
            flightCode: _flightCode,
            departure: _departure,
            arrival: _arrival,
            date: _date,
            seatClass: _seatClass,
            status: TicketStatus.Active,
            price: _price
        });

        _mint(passenger, newTicketId);
        emit TicketMinted(newTicketId, passenger, _flightCode);
    }

    // Check-in Function (Only Airline/Owner)
    function checkIn(uint256 ticketId) public onlyOwner {
        require(_ownerOf(ticketId) != address(0), "Ticket does not exist");
        require(tickets[ticketId].status == TicketStatus.Active, "Ticket is not active");

        tickets[ticketId].status = TicketStatus.Used;
        emit TicketCheckedIn(ticketId);
    }

    // Verify Ownership and Status (View Function for fast UI check)
    function verifyOwnership(address user, uint256 ticketId) public view returns (bool, TicketStatus) {
        if (_ownerOf(ticketId) != user) {
            return (false, TicketStatus.Cancelled);
        }
        return (true, tickets[ticketId].status);
    }

    // Make Token Soulbound
    function _update(address to, uint256 tokenId, address auth) internal virtual override returns (address) {
        address from = _ownerOf(tokenId);
        if (from != address(0)) {
            revert("Flightchain: Tickets are Soulbound and cannot be transferred.");
        }
        return super._update(to, tokenId, auth);
    }
}
