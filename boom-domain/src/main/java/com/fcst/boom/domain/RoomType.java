package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * TableName:T_ROOM_TYPE
 */

public class RoomType extends PageBean implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 2276626554289925825L;
	/**
     * 房间消费价格
     */
    private Float price;
    /**
     * 房间类型编号
     */
    private String roomtype;
    /**
     * 房间类型名称
     */
    private String roomtypename;
    private String id;
    /**
     * 备注
     */
    private String remark;

    /**
     * 获取 price
     * return
     */
    public Float getPrice() {
        return this.price;
    }

    /**
     * 设置 price
     *
     * @param price 房间消费价格
     */
    public void setPrice(Float price) {
        this.price = price;
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
     * 获取 roomtypename
     * return
     */
    public String getRoomtypename() {
        return this.roomtypename;
    }

    /**
     * 设置 roomtypename
     *
     * @param roomtypename 房间类型名称
     */
    public void setRoomtypename(String roomtypename) {
        this.roomtypename = roomtypename;
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
}
