# CS4998: Blockchain Development

## Project One

_Assigned_: January 30, 2022

_Due_: February 13th, 2022

## Task:

Now that you're familiar with using Remix and the Solidity syntax, its time to write a basic smart contract! For this assignment, we ask that you implement the following interface:

```solidity
// SPDX-License-Identifier: Nonlicensed
pragma solidity 0.7.6;

/// @title The interface for a Person
/// @notice This is the interface which you will be implementing for P1
interface IPerson {
    /// @notice Returns the name of the Person
    function getName() external view returns (string memory);

    /// @notice Returns the age of the Person
    function getAge() external view returns (uint256);

    /// @notice Returns true if the account who called this function is the contract deployer, false otherwise
    function isDeployer() external view returns (bool);

    /// @notice Returns whether the person is a soccer fan or not
    function isSoccerFan() external view returns (bool);

    /// @notice Sets the name of the person
    /// @param newName : a nonempty string that represents a name
    function setName(string calldata newName) external;

    /// @notice Sets the age of the person
    /// @param newAge : the new age of the person
    function setAge(uint256 newAge) external;

    /// @notice Returns the address of the account which deployed the contract
    function getDeployer() external view returns (address);

    /// @notice Sets whether the person is a soccer fan or not
    /// @param newPreference : the person's new soccer preference
    function setWatchesSoccer(bool newPreference) external;

    /// @notice Returns true if the person is exactly or is over 18, false otherwise
    function isAdult() external view returns (bool);

    /// @notice Adds a club to the person's list of favorite clubs
    /// @param club : a nonempty string representing a soccer club
    /// @dev change the value of favoriteClubs[club]
    function addFavoriteClub(string calldata club) external;

    /// @notice Remove a club from the person's list of favorite soccer clubs
    /// @param club : a nonempty string representing a club currently in the person's list of favorite clubs
    /// @dev change the value of favoriteClubs[club]
    function removeFavoriteClub(string calldata club) external;

    /// @notice Returns true if the club is favorited by the user, false otherwise
    /// @param club : a nonempty string representing a soccer club
    /// @dev return the value of favoriteClubs[club]
    function isFavoriteClub(string calldata club) external view returns (bool);

    /// @notice Adds a number to the person's list of favorite jersey numbers
    /// @param number : a number
    function addFavoriteJerseyNumber(uint256 number) external;

    /// @notice Returns the sum of the person's favorite jersey numbers
    function getJerseyNumberSum() external view returns (uint256);

    /// @notice Returns true if the number is favorited by the person, false otherwise
    /// @param num : a number
    function isFavoriteJerseyNumber(uint256 num) external view returns (bool);

    /// @notice Pops the farthest element from the favoriteJerseyNumbers list
    function popJerseyNumber() external;
}
```

Note that `@notice` describes the behavior of a function, while `@param` is describes each parameter, respectively. `@dev` gives advice on how to implement the function.

## Implementation

Here are the types of the state variables you should be using in your implementation:

| State Variable        | Type                             |
| --------------------- | -------------------------------- |
| favoriteClubs         | a mapping from strings to bools  |
| favoriteJerseyNumbers | a dynamic array of u256 integers |
| age                   | a u256 integer                   |
| account               | an address                       |
| watchesSoccer         | a boolean                        |
| name                  | a string                         |

In addition to the functions specified in `IPerson`, you must also implement a constructor for your function; your constructor should set the name of your person to _your name_, the age of the person to _your age_, the account of the person to the _address of your account_ (hint: check `msg`), and the `watchesSoccer` boolean to `true` (after all, your person is a soccer fan).

## Testing:

There are twelve tests cases that live within the `TestPerson` contract. When you are ready to test, _deploy the TestPerson smart contract and execute each test cases in order_ (so first run `testOne`, then `testTwo`, and so on). If you are able to pass all twelve test cases, you've completed P1!
