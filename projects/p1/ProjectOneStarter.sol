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

/// @title Implementation of the Person Interface
/// @author ADD YOUR NAME AND NETID HERE
contract Person is IPerson {}

/// @title Test Contract for the Person contract
/// @author Rodrigo Villar, rjv85
/// @notice Users are to run each test in order; if all tests pass, their implementation is correct!
contract TestPerson {
    Person me;
    address deployer;

    constructor() {
        me = new Person();
        deployer = msg.sender;
    }

    /// @notice Tests the name getter/setter function of the Person contract
    function testOne() public {
        me.setName("Satoshi Nakamoto");
        bytes32 hashed_value = keccak256(abi.encodePacked("Satoshi Nakamoto"));
        require(keccak256(abi.encodePacked(me.getName())) == hashed_value, "Name setter/getter function is incorrect!");
    }

    /// @notice Tests the return value of the getDeployer() function
    function testTwo() public view returns (bool) {
        require(deployer == me.getDeployer(), "getDeployer() is incorrect!");

        return true;
    }

    /// @notice Tests the age getter/setter function of the Person contract
    function testThree() public returns (bool) {
        me.setAge(21);

        require(me.getAge() == 21, "Age getter/setter is incorrect!");

        return true;
    }

    /// @notice Tests the isAdult() function
    function testFour() public returns (bool) {
        me.setAge(17);

        require(me.isAdult() == false, "isAdult() is incorrect!");

        return true;
    }

    /// @notice Tests the isAdult() function
    function testFive() public returns (bool) {
        me.setAge(58);

        require(me.isAdult(), "isAdult() is incorrect!");

        return true;
    }

    /// @notice Tests the soccer fan getter/setter functions
    function testSix() public returns (bool) {
        me.setWatchesSoccer(false);

        require(me.isSoccerFan() == false, "Soccer fan setter/getter is incorrect!");

        return true;
    }

    /// @notice Tests the soccer fan getter/setter functions
    function testSeven() public returns (bool) {
        me.setWatchesSoccer(true);

        require(me.isSoccerFan() == true, "Soccer fan setter/getter is incorrect!");

        return true;
    }

    /// @notice Tests the addFavoriteClub() and isFavoriteClub() functions
    function testEight() public returns (bool) {
        me.addFavoriteClub("Barcelona");

        require(me.isFavoriteClub("Barcelona"), "Favorite club add/getter is incorrect!");

        return true;
    }

    /// @notice Tests the addFavoriteClub(), isFavoriteClub(), and removeFavoriteClub() functions
    function testNine() public returns (bool) {
        me.addFavoriteClub("Real Madrid");
        me.removeFavoriteClub("Real Madrid");

        require(me.isFavoriteClub("Real Madrid") == false, "Favorite club remove/getter is incorrect!");

        return true;
    }

    /// @notice Tests the addFavoriteJerseyNumber() and isFavoriteJerseyNumber() functions
    function testTen() public returns (bool) {
        me.addFavoriteJerseyNumber(10);

        require(me.isFavoriteJerseyNumber(10), "Favorite jersey adder/checker is incorrect!");

        return true;
    }

    /// @notice Tests the isFavoriteJerseyNumber() function
    function testEleven() public view returns (bool) {
        require(me.isFavoriteJerseyNumber(7), "Favorite jersey adder/checker is incorrect!");

        return true;
    }

    /// @notice Tests the getJerseryNumberSum() function
    function testTwelve() public returns (bool) {
        me.addFavoriteJerseyNumber(10);
        me.addFavoriteJerseyNumber(9);
        me.addFavoriteJerseyNumber(8);

        require(me.getJerseryNumberSum() == 27, "getJerseyNumberSum() is incorrect!");

        return true;
    }
}
