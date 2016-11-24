package boots.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import boots.dao.SongRepository;
import boots.model.Song;

@Service @Transactional
public class SongService {
	
	private final SongRepository songRepository;
	
	public SongService(SongRepository songRepository){
		super();
		this.songRepository = songRepository;
	}
	
	public List<Song> findAll(){
		List<Song> songs = new ArrayList<Song>();
		for(Song song : songRepository.findAll()){
			songs.add(song);
		}
		return songs;
	}
	
	public void save(Song song){
		songRepository.save(song);
	}
	
	public void delete(int id){
		songRepository.delete(id);
	}
	
	public Song findOne(int id){
		return songRepository.findOne(id);
	}
	
}