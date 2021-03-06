pragma solidity ^0.4.18;

interface ICustomers {

  /**
   * @dev Allow new provider applications
   * @param _name The provider's name
   * @param _details A SHA256 hash of the new providers details
   * @param _fee The fee charged for customer verification
   */
  function newProvider(string _name, bytes32 _details, uint256 _fee) public returns (bool success);

  /**
   * @dev Change a providers fee
   * @param _newFee The new fee of the provider
   */
  function changeFee(uint256 _newFee) public returns (bool success);

  /**
   * @dev Verify an investor
   * @param _customer The customer's public key address
   * @param _countryJurisdiction The country urisdiction code of the customer
   * @param _divisionJurisdiction The subdivision jurisdiction code of the customer
   * @param _role The type of customer - investor:1, delegate:2, issuer:3, marketmaker:4, etc.
   * @param _accredited Whether the customer is accredited or not (only applied to investors)
   * @param _expires The time the verification expires
   */
  function verifyCustomer(
    address _customer,
    bytes32 _countryJurisdiction,
    bytes32 _divisionJurisdiction,
    uint8 _role,
    bool _accredited,
    uint256 _expires,
    uint _nonce,
    uint8 _v,
    bytes32 _r,
    bytes32 _s
  ) public returns (bool success);

   ///////////////////
    /// GET Functions
    //////////////////

  /**
    * @dev Get customer attestation data by KYC provider and customer ethereum address
    * @param _provider Address of the KYC provider.
    * @param _customer Address of the customer ethereum address
    */
  function getCustomer(address _provider, address _customer) public view returns (
    bytes32,
    bytes32,
    bool,
    uint8,
    uint256
  );

  /**
   * Get provider details and fee by ethereum address
   * @param _providerAddress Address of the KYC provider
   */
  function getProvider(address _providerAddress) public view returns (
    string name,
    uint256 joined,
    bytes32 details,
    uint256 fee
  );
}
