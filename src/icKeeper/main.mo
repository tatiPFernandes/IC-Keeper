import List  "mo:base/List";
import Debug "mo:base/Debug";

actor icKeeper {

/* //creating a type Note that represent the kind of data 
that will be stored in the icKeeper app
 */ 
  public type Note= {
    title: Text;
    content: Text;
  };
  //creating a new list object (like an array of note obj )
  var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text){

    let newNote: Note ={
      title = titleText;
      content = contentText;
    };

    //creating a new list that add a new note to the beginning of the list of note 
   notes := List.push(newNote, notes);
   Debug.print(debug_show(notes));

  };

  public query func readNotes(): async [Note]{

    return List.toArray(notes);
  };

  public func removeNote(id: Nat){
     let listFront = List.take(notes, id);
     let listBack = List.drop(notes, id + 1);
     notes := List.append(listFront, listBack);
 

  };
 
};
