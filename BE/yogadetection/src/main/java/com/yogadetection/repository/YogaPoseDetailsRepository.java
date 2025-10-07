package com.yogadetection.repository;

import com.yogadetection.entity.YogaPoseDetails;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface YogaPoseDetailsRepository extends JpaRepository<YogaPoseDetails, String> {
    @Query("SELECT y FROM YogaPoseDetails y WHERE (:keyWor IS NULL OR LOWER(y.name) LIKE LOWER(CONCAT('%', :keyWor, '%'))) ")
    Page<YogaPoseDetails> getListYogaPose(@Param("keyWor") String keyWor, Pageable pageable);

    @Query("SELECT y FROM YogaPoseDetails y WHERE y.code = :code")
    YogaPoseDetails getYogaPoseDetails(@Param("code") String code);
}
