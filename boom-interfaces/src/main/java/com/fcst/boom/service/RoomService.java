package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Room;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_ROOM表Service接口
 */

public interface RoomService {

    /**
     * 获取
     *
     * @param room
     * @return int
     */
    public Room get(Room room) throws Exception;

    /**
     * 新增
     *
     * @param room
     * @return int
     */
    public int insert(Room room) throws Exception;

    /**
     * 删除
     *
     * @param room
     * @return int
     */
    public int delete(Room room) throws Exception;

    /**
     * 更新
     *
     * @param room
     * @return int
     */
    public int update(Room room) throws Exception;

    /**
     * 查询
     *
     * @param room
     * @return List<Room>
     */
    public List<Room> query(Room room) throws Exception;

    /**
     * 查询记录数
     *
     * @param room
     * @return List<Room>
     */
    public Integer queryCount(Room room) throws Exception;
}
