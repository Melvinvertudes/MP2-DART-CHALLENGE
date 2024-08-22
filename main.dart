class Song {
  String title;          
  String artist;         
  int? duration;         

  Song(this.title, this.artist, [this.duration]);

  @override
  String toString() {
    
    return '"$title" by $artist' + (duration != null ? ' (${duration} sec)' : '');
  }
}

class Playlist {
  String name;           
  List<Song> songs = []; 

  Playlist(this.name);

  void addSong(String title, String artist, [int? duration]) {
    songs.add(Song(title, artist, duration));
  }

  bool removeSong(String title) {
    for (var i = 0; i < songs.length; i++) {
      if (songs[i].title == title) {
        songs.removeAt(i);
        return true; 
      }
    }
    return false; 
  }

  int totalDuration() {
    return songs.where((song) => song.duration != null).fold(0, (sum, song) => sum + song.duration!);
  }

  @override
  String toString() {
    return 'Playlist: $name\n' + songs.map((song) => song.toString()).join('\n');
  }
}

class MusicFestival {
  String name;          
  List<Playlist> stages = []; 

  MusicFestival(this.name);

  void addStage(Playlist stage) {
    stages.add(stage);
  }

  bool removeStage(String name) {
    for (var i = 0; i < stages.length; i++) {
      if (stages[i].name == name) {
        stages.removeAt(i);
        return true;
      }
    }
    return false;
  }

  int totalDuration() {
    return stages.fold(0, (sum, stage) => sum + stage.totalDuration());
  }

  @override
  String toString() {
    return 'Festival: $name\n' + stages.map((stage) => stage.toString()).join('\n');
  }
}

void main() {
  var playlist1 = Playlist("Flow G Hits");
  playlist1.addSong("Business Talk", "Flow G", 180);
  playlist1.addSong("Rapstar", "Flow G", 190);
  playlist1.addSong("G Wolf", "Flow G", 200);
  playlist1.addSong("Nasa Atin Ang Panalo", "Flow G", 220);
  playlist1.addSong("Batugan", "Flow G", 210);

  var playlist2 = Playlist("Ex Battalion Hits");
  playlist2.addSong("Hayaan Mo Sila", "Ex Battalion", 200);
  playlist2.addSong("Need You", "Ex Battalion", 190);
  playlist2.addSong("No Games", "Ex Battalion", 180);
  playlist2.addSong("South Boys", "Ex Battalion", 210);
  playlist2.addSong("Come With Me", "Ex Battalion", 220);

  var playlist3 = Playlist("Chill Vibes");
  playlist3.addSong("Nothing", "Bruno Major", 190);
  playlist3.addSong("The Most Beautiful Thing", "Bruno Major", 210);
  playlist3.addSong("She Choose Me", "Bruno Major", 180);
  playlist3.addSong("Old Fashionated", "Bruno Major", 200);
  playlist3.addSong("Home", "Bruno Major", 220);

  var playlist4 = Playlist("Dua Lipa Hits");
  playlist4.addSong("Be The One", "Dua Lipa", 203);
  playlist4.addSong("IDGAF", "Dua Lipa", 183);
  playlist4.addSong("New Love", "Dua Lipa", 208);
  playlist4.addSong("Kiss And Make Up", "Dua Lipa", 183);
  playlist4.addSong("Pretty Please", "Dua Lipa", 231);

  var festival = MusicFestival("Summer Music Fest");
  festival.addStage(playlist1);
  festival.addStage(playlist2);
  festival.addStage(playlist3);
  festival.addStage(playlist4);

  print("Initial Festival Details:");
  print(festival);

  print("\nTotal duration of the festival: ${festival.totalDuration()} seconds");

  playlist1.removeSong("Swag");
  festival.removeStage("Chill Vibes");

  print("\nUpdated Festival Details:");
  print(festival);

  print("\nUpdated total duration of the festival: ${festival.totalDuration()} seconds");
}



