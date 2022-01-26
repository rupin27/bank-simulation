# bank-simulation
<p>Used least recently used algorithm to implement caches. Used functions like pipe and fork in C to simulate the communication between a bank and ATM. </p1>
<ol>
  <li> The bank/atm simulator will fork a number of processes that represent a bank and n ATM terminals that can respond to several different transactions provide by an ATM user.
  </li> 
  <li> The ATM transactions are simulated through a trace file containing a sequence of ATM transactions that each ATM will read and send to a bank process over a “pipe”. 
  </li>
  <li> The bank process will receive commands from the ATMs and will perform the proper transaction received from the ATMs. The bank then respond back to the ATM indicating the success or failure of the transaction.
  </li>
