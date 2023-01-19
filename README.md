# Simple Redis client/server mock 
Greetings! We are excited to have you take part in this development test. 
The purpose of this test is to assess your understanding of Ruby and Redis, and your ability to create a code that meets the requirements. Please read the list of requirements and testing examples carefully and make sure to use good programming practices, such as proper naming conventions, code design and formatting. 
You will have 1 week to complete the test. 

## Must have requirements: 
- A small mock of a Redis server that runs accepting connections on some port.
- Basic commands such as set, get, unset, incr and numequalto
- A client that connects to the server, and provides a console for entering commands
- Specs


## Nice to have requirement: 
- Implement transactioned commands, allowing for commit/rollback of provided commands

## Examples

```
local> set a 10
'OK'
local> get a
10
local> begin
TRANSACTION INITIATED
local> get a
10
local> set a 20
'OK'
local> get a
20
local> commit
SAVED
local> exit
BYE
```

Once the results are in, we will review them and reach out to you to a technical session about your code. Good luck!