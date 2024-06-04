import Array "mo:base/Array";

actor MessageBoard {
    // Define a Message type
    type Message = {
        id: Nat;
        text: Text;
    };

    // Initialize an array to store messages
    var messages : [Message] = [];
    var nextId : Nat = 0;

    // Function to post a new message
    public shared({caller}) func postMessage(text: Text) : async Text {
        let newMessage : Message = {
            id = nextId;
            text = text;
        };
        messages := Array.append(messages, [newMessage]);
        nextId += 1;
        return "Message posted successfully.";
    };

    // Function to get all messages
    public query func getMessages() : async [Message] {
        return messages;
    };
};
