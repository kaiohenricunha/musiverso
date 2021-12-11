package com.khsdc.repository;

import com.khsdc.model.Song;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {

    Song findById(Long id);

    List<Song> findBySongName(String name);
}
