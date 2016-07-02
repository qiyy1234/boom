package com.fcst.boom.service.impl;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.RoomTypeDao;
import com.fcst.boom.domain.RoomType;
import com.fcst.boom.service.RoomTypeService;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016�?3�?4�?
 * Time: 23:06:12
 * 功能:T_ROOM_TYPE表Service接口实现�?
 */

public class RoomTypeServiceImpl implements RoomTypeService {
    @javax.annotation.Resource
    private RoomTypeDao roomTypeDao;


    @Override
    public RoomType get(RoomType roomType) throws Exception {
        return roomTypeDao.get(roomType);
    }


    @Override
    @Transactional
    public int insert(RoomType roomType) throws Exception {
        return roomTypeDao.insert(roomType);
    }

    @Override
    @Transactional
    public int delete(RoomType roomType) throws Exception {
        return roomTypeDao.delete(roomType);
    }

    @Override
    @Transactional
    public int update(RoomType roomType) throws Exception {
        return roomTypeDao.update(roomType);
    }

    @Override
    public List<RoomType> query(RoomType roomType) throws Exception {
        return roomTypeDao.query(roomType);
    }

    @Override
    public Integer queryCount(RoomType roomType) throws Exception {
        return roomTypeDao.queryCount(roomType);
    }

}
