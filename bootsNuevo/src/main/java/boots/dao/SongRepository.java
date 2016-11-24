package boots.dao;

import org.springframework.data.repository.CrudRepository;
import boots.model.Song;

public interface SongRepository extends CrudRepository<Song, Integer>{

}
