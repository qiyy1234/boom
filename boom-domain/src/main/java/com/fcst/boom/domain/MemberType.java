package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:11
 * TableName:T_MEMBER_TYPE
 */

public class MemberType extends PageBean implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = -4813105292772142312L;
	/**
     * 会员类型名称
     */
    private String typename;
    private String id;
    /**
     * 备注
     */
    private String remark;
    /**
     * 会员消费折扣率
     */
    private Float rebate;
    /**
     * 会员类型编号
     */
    private String type;

    /**
     * 获取 typename
     * return
     */
    public String getTypename() {
        return this.typename;
    }

    /**
     * 设置 typename
     *
     * @param typename 会员类型名称
     */
    public void setTypename(String typename) {
        this.typename = typename;
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
     * 获取 rebate
     * return
     */
    public Float getRebate() {
        return this.rebate;
    }

    /**
     * 设置 rebate
     *
     * @param rebate 会员消费折扣率
     */
    public void setRebate(Float rebate) {
        this.rebate = rebate;
    }

    /**
     * 获取 type
     * return
     */
    public String getType() {
        return this.type;
    }

    /**
     * 设置 type
     *
     * @param type 会员类型编号
     */
    public void setType(String type) {
        this.type = type;
    }
}
