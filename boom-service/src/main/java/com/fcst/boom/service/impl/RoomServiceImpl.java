package com.fcst.boom.service.impl;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.RoomDao;
import com.fcst.boom.domain.Room;
import com.fcst.boom.service.RoomService;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016�?3�?4�?
 * Time: 23:06:12
 * 功能:T_ROOM表Service接口实现�?
 */

public class RoomServiceImpl implements RoomService {
    @javax.annotation.Resource
    private RoomDao roomDao;


    @Override
    public Room get(Room room) throws Exception {
        return roomDao.get(room);
    }


    @Override
    @Transactional
    public int insert(Room room) throws Exception {
        return roomDao.insert(room);
    }

    @Override
    @Transactional
    public int delete(Room room) throws Exception {
        return roomDao.delete(room);
    }

    @Override
    @Transactional
    public int update(Room room) throws Exception {
        return roomDao.update(room);
    }

    @Override
    public List<Room> query(Room room) throws Exception {
        return roomDao.query(room);
    }

    @Override
    public Integer queryCount(Room room) throws Exception {
        return roomDao.queryCount(room);
    }

}
