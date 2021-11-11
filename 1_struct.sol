//SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

contract TestStruct {
    struct Book {
        string bookName;
        string authorName;
        uint256 price;
    }

    Book public book;
    Book[] public books;
    mapping(address => Book[]) public booksByOwner;

    function example() external {
        Book memory javaBook = Book("Java Programming", "Liang", 30);
        Book memory javaBook1 = Book({
            bookName: "Java Programming",
            authorName: "Liang",
            price: 30
        });
        Book memory javaBook2;
        javaBook2.bookName = "Java Programming";
        javaBook2.authorName = "Liang";
        javaBook2.price = 30;

        //Add data to the storage
        books.push(javaBook);
        books.push(javaBook1);
        books.push(javaBook2);

        //Add owner of Book
        booksByOwner[msg.sender] = books;

        //Remove data from array
        Book storage javaBook3 = books[0];
        delete javaBook3.price;
        delete javaBook3.authorName;
    }
}
