#basics #dev 
HTTP & HTTPS Protocol

To can define what is the http protocol you have first know the meaning of protocol, dyk? so

Protocol
protocol is a system of rules that define how data is exchanged within or between computers.

Communications between devices require that the devices agree on the format of the data that is being exchanged

*==So, the set of those rules that defines a format is called a protocol==*

Now, knowing the concept of protocol let's look about http and https protocol

###### HTTP Definition
**HTTP**(Hypertext Transfer Protocol) is a [protocol](https://developer.mozilla.org/en-US/docs/Glossary/Protocol) for fetching resources such as HTML documents. It is the foundation of any data exchange on the Web and it is a client-server protocol, which means requests are initiated by the recipient, usually the Web browser. A complete document is reconstructed from the different sub-documents fetched, for instance, text, layout description, images, videos, scripts, and more.

Clients and servers communicate by exchanging individual messages (as opposed to a stream of data). The messages sent by the client, usually a Web browser, are called _requests_ and the messages sent by the server as an answer are called _responses_.

Designed in the early 1990s, HTTP is an extensible protocol which has evolved over time. It is an application layer protocol that is sent over [TCP](https://developer.mozilla.org/en-US/docs/Glossary/TCP), or over a [TLS](https://developer.mozilla.org/en-US/docs/Glossary/TLS)-encrypted TCP connection, though any reliable transport protocol could theoretically be used. Due to its extensibility, it is used to not only fetch hypertext documents, but also images and videos or to post content to servers, like with HTML form results. HTTP can also be used to fetch parts of documents to update Web pages on demand.

###### TCP
(Transmission Control Protocol) is an important network protocol that lets two hosts connect and exchange data streams. TCP guarantees the delivery of data and packets in the same order as they were sent.
TCP's role is to ensure the packets are reliably delivered, and error-free. TCP implements [congestion control](https://en.wikipedia.org/wiki/TCP_congestion_control), which means the initial requests start small, increasing in size to the levels of bandwidth the computers, servers, and network can support.
To avoid [congestive collapse](https://en.wikipedia.org/wiki/Congestive_collapse "Congestive collapse"), TCP uses multi-faceted congestion-control strategy. For each connection, TCP maintains a CWND, limiting the total number of unacknowledged packets that may be in transit end-to-end.

###### TLS
Transport Layer Security(TLS) formerly(antes) known as Secure Sockets Layer(SSL) is a protocol used by applications to communicate securely across a network, preventing tampering with and eavesdropping on email, web browsing, messaging and other protocols. Bot TLS and SSL are client / server protocols that ensure communication privacy by using cryptographic protocols to provide security over a network. When a server and client communicate using TLS, it ensures that no third party can eavesdrop(escuchar) or tamper(manipular) with any message

###### HTTPS
It's just the HTTP protocol with TLS

##### in summary
- HTTPS defines the estructure and format of messages between client and server, specifying what's the client request and the server's response
- TCP provides the communication channel between client and server, ensuring reliable and orderly transmission of data
- TLS provides  security for data transmission through TCP, ensuring that communication between client and server is encrypted and protected against interception and manipulation by third parties 