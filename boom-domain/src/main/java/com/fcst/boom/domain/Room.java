package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * TableName:T_ROOM
 */

public class Room extends PageBean implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = -1338403586090731109L;
	/**
     * 房间使用状态 00:已用 01:空闲 02:已预约
     */
    private String usestate;
    /**
     * 房间类型编号
     */
    private String roomtype;
    private String id;
    /**
     * 备注
     */
    private String remark;
    /**
     * 房间启用状态 00:启用 01:未启用
     */
    private String roomsstate;
    private String roomcode;

    /**
     * 获取 usestate
     * return
     */
    public String getUsestate() {
        return this.usestate;
    }

    /**
     * 设置 usestate
     *
     * @param usestate 房间使用状态 00:已用 01:空闲 02:已预约
     */
    public void setUsestate(String usestate) {
        this.usestate = usestate;
    }

    /**
     * 获取 roomtype
     * return
     */
    public String getRoomtype() {
        return this.roomtype;
    }

    /**
     * 设置 roomtype
     *
     * @param roomtype 房间类型编号
     */
    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    /**
     * 获取 id
     * return
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置 id
     *
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取 remark
     * return
     */
    public String getRemark() {
        return this.remark;
    }

    /**
     * 设置 remark
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取 roomsstate
     * return
     */
    public String getRoomsstate() {
        return this.roomsstate;
    }

    /**
     * 设置 roomsstate
     *
     * @param roomsstate 房间启用状态 00:启用 01:未启用
     */
    public void setRoomsstate(String roomsstate) {
        this.roomsstate = roomsstate;
    }

    /**
     * 获取 roomcode
     * return
     */
    public String getRoomcode() {
        return this.roomcode;
    }

    /**
     * 设置 roomcode
     *
     * @param roomcode
     */
    public void setRoomcode(String roomcode) {
        this.roomcode = roomcode;
    }
}
