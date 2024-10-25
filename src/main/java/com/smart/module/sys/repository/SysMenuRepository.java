package com.smart.module.sys.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import  org.springframework.stereotype.Repository;
import com.smart.module.sys.entity.SysMenu;

/**
 * sys_menu Repository
*/ 
@Repository 
public interface SysMenuRepository extends JpaRepository<SysMenu, Long> {
}

